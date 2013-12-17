<?php


/**
 * Wyłączony try?
 * Może dodać to gdzieś w configu? CO?
 */
// try {
    
    /**
     * Włączenie raportowania błędów na ekran.
     * @TODO podpięcie tych informacji pod konfigurację
     * @TODO dodanie defaultowych wartości oraz narzędzia kontrolnego
     */
    error_reporting(E_ALL ^ E_NOTICE);
    ini_set("display_errors", 1);
    
    /**
     * Kontrola wersji
     * @TODO podpięcie tych informacji pod konfigurację
     */
    if (version_compare(PHP_VERSION, '5.3.7', '<')) {
        exit("PHP version smaller than 5.3.7 !");
    }

    /**
     *
     * @param unknown $class            
     * @throws Exception
     */
    function autoload ($class)
    {
        $paths = explode(PATH_SEPARATOR, get_include_path());
        $flags = PREG_SPLIT_NO_EMPTY | PREG_SPLIT_DELIM_CAPTURE;
        $file = strtolower(
                str_replace("\\", DIRECTORY_SEPARATOR, trim($class, "\\"))) .
                 ".php";
        foreach ($paths as $path) {
            $combined = $path . DIRECTORY_SEPARATOR . $file;
            if (file_exists($combined)) {
                include ($combined);
                return;
            }
        }
        throw new Exception("{$class} not found");
    }

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Autoloader
    {

        public static function autoload ($class)
        {
            autoload($class);
        }
    }
    
    /**
     */
    spl_autoload_register('autoload');
    spl_autoload_register(
            array(
                    'autoloader',
                    'autoload'
            ));
    
    /**
     * Wczytanie bootstrapu z katalogu aplikacji
     * a nie z bierzacego dla index.php
     */
    require_once ('bootstrap.php');
// } catch (Exception $e) {
    
//     /**
//      * Lista wyjątków.
//      * Do aktualizacji zgodnie z zawartością FRAMEWORK
//      */
    
//     $exceptions = array(
//             "500" => array(
//                     // "Framework\Cache\Exception",
//                     // "Framework\Cache\Exception\Argument",
//                     // "Framework\Cache\Exception\Implementation",
//                     // "Framework\Cache\Exception\Service",
//                     "Framework\Configuration\Exception",
//                     "Framework\Configuration\Exception\Argument",
//                     "Framework\Configuration\Exception\Implementation",
//                     "Framework\Configuration\Exception\Syntax",
//                     "Framework\Controller\Exception",
//                     "Framework\Controller\Exception\Argument",
//                     "Framework\Controller\Exception\Implementation",
//                     "Framework\Core\Exception",
//                     "Framework\Core\Exception\Argument",
//                     "Framework\Core\Exception\Implementation",
//                     "Framework\Core\Exception\Property",
//                     "Framework\Core\Exception\ReadOnly",
//                     "Framework\Core\Exception\WriteOnly",
//                     "Framework\Database\Exception",
//                     "Framework\Database\Exception\Argument",
//                     "Framework\Database\Exception\Implementation",
//                     "Framework\Database\Exception\Service",
//                     "Framework\Database\Exception\Sql",
//                     "Framework\Model\Exception",
//                     "Framework\Model\Exception\Argument",
//                     "Framework\Model\Exception\Connector",
//                     "Framework\Model\Exception\Implementation",
//                     "Framework\Model\Exception\Primary",
//                     "Framework\Model\Exception\Type",
//                     "Framework\Model\Exception\Validation",
//                     "Framework\Request\Exception",
//                     "Framework\Request\Exception\Argument",
//                     "Framework\Request\Exception\Implementation",
//                     "Framework\Request\Exception\Response",
//                     "Framework\Router\Exception",
//                     "Framework\Router\Exception\Argument",
//                     "Framework\Router\Exception\Implementation",
//                     "Framework\Session\Exception",
//                     "Framework\Session\Exception\Argument",
//                     "Framework\Session\Exception\Implementation",
//                     "Framework\Template\Exception",
//                     "Framework\Template\Exception\Argument",
//                     "Framework\Template\Exception\Implementation",
//                     "Framework\Template\Exception\Parser",
//                     "Framework\View\Exception",
//                     "Framework\View\Exception\Argument",
//                     "Framework\View\Exception\Data",
//                     "Framework\View\Exception\Implementation",
//                     "Framework\View\Exception\Renderer",
//                     "Framework\View\Exception\Syntax"
//             ),
//             "404" => array(
//                     "Framework\Router\Exception\Action",
//                     "Framework\Router\Exception\Controller"
//             )
//     );
    
//     $exception = get_class($e);
    
//     /**
//      * Szybkie renderowanie strony błędy po wyłapaniu aktywnego wyjątku
//      */
//     foreach ($exceptions as $template => $classes) {
//         foreach ($classes as $class) {
//             if ($class == $exception) {
//                 header("Content-type: text/html");
//                 include (APP_PATH . "/application/views/errors/{$template}.php");
//                 exit();
//             }
//         }
//     }
    
//     /**
//      * Wywołanie stroy błedu bez wyłapania wyjątku.
//      */
//     header("Content-type: text/html");
//     echo "An error occurred.";
//     exit();
// }
