<?php
use Shared\Controller as Controller;
use Framework\Registry as Registry;
use Framework\RequestMethods as RequestMethods;

/**
 *
 * @author Marcin
 *        
 */
class Home extends Framework\Controller
{

    /**
     * @once
     * @protected
     */
    public function init ()
    {
        echo "init<br />";
    }

    /**
     * @protected
     */
    public function authenticate ()
    {
        echo "authenticate<br />";
    }

    /**
     * @before init, authenticate,
     * @after notify
     */
    public function index ()
    {
        echo "hello world!<br />";
    }

    /**
     * @protected
     */
    public function notify ()
    {
        echo "notify!<br />";
    }
}