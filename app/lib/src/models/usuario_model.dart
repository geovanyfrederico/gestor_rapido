<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property string $nome
 * @property string $tipo
 * @property integer $pin
 * @property boolean $ativo
 * @property Compra[] $compras
 * @property MovimentoDeStock[] $movimentoDeStocks
 * @property Venda[] $vendas
 */
class Usuario extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'usuario';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['nome', 'tipo', 'pin', 'ativo'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function compras()
    {
        return $this->hasMany('App\Compra');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function movimentoDeStocks()
    {
        return $this->hasMany('App\MovimentoDeStock');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function vendas()
    {
        return $this->hasMany('App\Venda');
    }
}
