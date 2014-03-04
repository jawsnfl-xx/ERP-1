<?php

/**
 *
 * @author Marcin
 *
 */
namespace Framework\Model
{

    /**
     */
    use Framework\Base as Base;
    use Framework\Model as Model;

    /**
     *
     * @author Marcin Pyrka
     *        
     */
    class Mensuration extends Model
    {

        /**
         * @column
         * @readwrite
         * @primary
         * @type autonumber
         */
        protected $id_mensuration;

        /**
         * @column
         * @readwrite
         * @type integer
         *
         * @var unknown
         */
        protected $measurement_id_measurement;

        /**
         * @column
         * @readwrite
         * @type integer
         *
         * @var unknown
         */
        protected $control_measurements_id_control_measurements;

        /**
         * @column
         * @readwrite
         * @type integer
         *
         * @var unknown
         */
        protected $dimension_id_dimension;

        /**
         * @column
         * @readwrite
         * @type integer
         *
         * @var unknown
         */
        protected $sample_numer;

        /**
         * @column
         * @readwrite
         * @type integer
         *
         * @var unknown
         */
        protected $value;
    }
}
