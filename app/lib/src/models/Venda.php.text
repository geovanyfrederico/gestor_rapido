<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $cliente_id
 * @property integer $usuario_id
 * @property string $data
 * @property int $totalQtd
 * @property float $totalPagar
 * @property float $totalPago
 * @property float $troco
 * @property Cliente $cliente
 * @property Usuario $usuario
 */
class Venda extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'venda';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['cliente_id', 'usuario_id', 'data', 'totalQtd', 'totalPagar', 'totalPago', 'troco'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function cliente()
    {
        return $this->belongsTo('App\Cliente');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function usuario()
    {
        return $this->belongsTo('App\Usuario');
    }
}
