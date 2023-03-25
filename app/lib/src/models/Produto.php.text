<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property string $nome
 * @property float $preco
 * @property string $foto
 * @property string $stock
 * @property MovimentoDeStock[] $movimentoDeStocks
 * @property ProdutoNaCompra[] $produtoNaCompras
 * @property ProdutoNaVenda[] $produtoNaVendas
 */
class Produto extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'produto';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['nome', 'preco', 'foto', 'stock'];

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
    public function produtoNaCompras()
    {
        return $this->hasMany('App\ProdutoNaCompra');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function produtoNaVendas()
    {
        return $this->hasMany('App\ProdutoNaVenda');
    }
}
