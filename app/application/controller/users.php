<?php
namespace Application\Controller
{

    use Application\Controller as Controller;
    use Framework\Registry as Registry;
    use Framework\RequestMethods as RequestMethods;

    /**
     *
     * @author Marcin
     *         @NOTE
     *         W ten sposób można zapisać podstawę działania kontrolerów.
     *         Za pomocą wpisów w komentarzach przez deklaracją
     *         można inicjować kolejność kroków i wymagać dla podnoszenia sie funkcji
     *        
     */
    class Users extends Controller
    {

        /**
         * @readwrite
         */
        protected $_parameters;

        /**
         *
         * @param unknown $options            
         */
        public function __construct($options)
        {
            /**
             */
            $this->_parameters = $options['parameters'];
        }

        /**
         * @once
         * @protected
         */
        /**
         * Wykonywana jest inicjalizacja wszystkiego co może być potrzebne.
         *
         * @TODO
         * Włącznie z przekazaniem dalszych danych dla Smatry
         */
        public function init()
        {}

        /**
         * @protected
         */
        /**
         * Wykonywane są wszystkie funkcje związane z kontrolą uwierzytelniania
         *
         * @TODO
         * Budowa oddzielnej klasy autentykacji.
         * W tym miejscy jedynie jej uruchmienie.
         */
        public function authenticate()
        {}

        /**
         * @once
         * @protected
         */
        public function notify()
        {}

        /**
         * @before init, authenticate,
         * @after notify
         */
        public function index()
        {
            print 'formularz logowania';
        }

        /**
         * @before init
         * @after notify
         */
        public function login()
        {
            if (RequestMethods::post("login")) {
                
                /**
                 * @TODO
                 * - sprawdzić działanie requestmethods
                 * - koniecznie przez requestami zbudować form logowania :D
                 */
                $email = RequestMethods::post("email");
                $password = RequestMethods::post("password");
                
                /**
                 * @TODO
                 * - zmienić odwołanie dla view na zgodne z aktualnym
                 * - poprawić komunukacje z widokiem
                 */
                $view = $this->getActionView();
                $error = false;
                if (empty($email)) {
                    // $view->set("email_error", "Email not provided");
                    $error = true;
                }
                if (empty($password)) {
                    // $view->set("password_error", "Password not provided");
                    $error = true;
                }
                if (! $error) {
                    
                    /**
                     * @TODO
                     * - zbudować zapytanie zgodne z aktualną uproszczoną metodą dostępu
                     * do bazy danych
                     */
                    $user = User::first(array(
                        "email = ?" => $email,
                        "password = ?" => $password,
                        "live = ?" => true,
                        "deleted = ?" => false
                    ));
                    
                    /**
                     * @TODO
                     * - wyłączyć rejestrację zmiennej
                     * - przepisać header location na zgodne z aktualnym
                     * lub zrobić przeniesienie dla ref (ale chyba nie będzie potrzeby)
                     */
                    if (! empty($user)) {
                        $session = Registry::get("session");
                        $session->set("user", serialize($user));
                        header("Location: /users/profile.html");
                        exit();
                    } else {
                    
                    /**
                     * @TODO
                     * - obsłużyć błędy logowania
                     */
                        // $view->set("password_error", "Email address and/or password are incorrect");
                    }
                    exit();
                }
            }
        }

        /**
         * @before init, authenticate,
         * @after notify
         */
        public function profile()
        {
            $session = Registry::get("session");
            $user = unserialize($session->get("user", null));
            if (empty($user)) {
                $user = new StdClass();
                $user->first = "Mr.";
                $user->last = "Smith";
            }
            $this->getActionView()->set("user", $user);
        }
    }
}