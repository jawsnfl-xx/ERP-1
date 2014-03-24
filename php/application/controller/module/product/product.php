<?php
use Application\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;
use Framework\View;
use Framework\Request;

if ($this->_parameters[1] === 'view') {
    
    $this->_table['product']['view'] = $product->_createView($this->_parameters[2]);
    $this->_table['orders']['list'] = $orders->_createListLimit(5);
    $this->_table['packages']['list'] = $packages->_createListLimit(5);
    $this->_table['quality_management']['list'] = $quality_management->_createListLimit(5);
    
    // var_dump( $this->_table['product']);
} elseif ($this->_parameters[1] === 'add') {
    include_once 'add/add.php';
} elseif ($this->_parameters[1] === '_add') {
    include_once '_add/_add.php';
} elseif ($this->_parameters[1] === 'search') {
    include_once 'search/search.php';
} elseif ($this->_parameters[1] === 'page') {
    include_once 'page/page.php';
} elseif ($this->_parameters[1] === 'delete') {
    
    print 'sprawdzamy -> ';
    /**
     * Sprawdzamy, czy został podany parametr "2"
     */
    if ($this->_parameters[2]) {
        print 'mamy parametr -> ';
        /**
         * Sprawdzamy, czy podany id produktu znajduje się w bazie.
         */
        if ($product->_isExistsByID($this->_parameters[2])) {
            
            print 'mamy id -> ';
            /**
             * Możemy zacząć kasować produkt
             */
            if ($status = $product->_statusDeleteSingle($this->_parameters[2])) {
                
                print 'kasujemy';
                
                header("Location: /module/product_technology/product/page/");
                return TRUE;
            } else {
                
                print 'nie udało się skasować';
                /**
                 * Nie udało się skasowanie wpisu w bazie
                 */
                return FALSE;
            }
        } else {
            print 'brak detalu o podanym id';
            /**
             * Nie istnieje detal o podanym id w bazie
             */
            return FALSE;
        }
    } else {
        print 'brak id w zapytaniu';
        /**
         * Nie podano id w zapytaniu
         */
        return FALSE;
    }
} else {
    /**
     * W wypadku wyświetlenia dowolnej ze stron
     * pt/product wyświerla listę stron z defaultową
     * pierwszą stroną.
     * Zawiera ona 20 wyników.
     */
    header('Location: /module/product_technology/product/page/1/20');
}