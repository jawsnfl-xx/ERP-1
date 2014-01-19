<?php
namespace Application\Controller
{

    use Application\Controller as Controller;
    use Framework\Registry as Registry;
    use Framework\RequestMethods as RequestMethods;

    /**
     *
     * @author Marcin
     *        
     */
    class Home extends Controller
    {

        public function __construct()
        {
        /**
         * Nic nie robi (póki co...
         * :D )
         */
            // print RequestMethods::get("sample");
        }
        
        // /**
        // * @once
        // * @protected
        // */
        // public function init ()
        // {
        // // echo "init<br />";
        // }
        
        // /**
        // * @protected
        // */
        // public function authenticate ()
        // {
        // // echo "authenticate<br />";
        // }
        
        // /**
        // * @before init, authenticate,
        // * @after notify
        // */
        public function index()
        {
            $data = "hello world!<br />";
        }

        /**
         * @protected
         */
        public function notify()
        {
            // echo "notify!<br />";
        }

        public function login()
        {
            
            // print 'nic nie rtoib';
        }

        public function begin()
        {
            
            // print 'nic nie rtoib';
        }

        public function second()
        {
            
            // print 'nic nie rtoib';
        }
    }
}