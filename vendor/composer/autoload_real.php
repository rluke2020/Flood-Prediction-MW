<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInit5a02c7c375be42cfc57db5a1f5bf85dd
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInit5a02c7c375be42cfc57db5a1f5bf85dd', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInit5a02c7c375be42cfc57db5a1f5bf85dd', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInit5a02c7c375be42cfc57db5a1f5bf85dd::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}
