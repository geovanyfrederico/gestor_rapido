<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $produto_id
 * @property string $nome
 * @property int $qtd
 * @property float $preco
 * @property float $precoTotal
 * @property Produto $produto
 */
class ProdutoNaVenda extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'produtoNaVenda';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['produto_id', 'nome', 'qtd', 'preco', 'precoTotal'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function produto()
    {
        return $this->belongsTo('App\Produto');
    }
}
