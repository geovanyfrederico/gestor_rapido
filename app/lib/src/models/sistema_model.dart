<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property string $nome
 * @property string $tipo
 */
class Sistema extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'sistema';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['nome', 'tipo'];
}
