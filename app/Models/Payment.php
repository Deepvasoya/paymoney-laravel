<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * Partner PayMoney (or external PSP) payment row — table `payments`.
 */
class Payment extends Model
{
    protected $fillable = [
        'user_id',
        'amount',
        'currency',
        'status',
        'external_transaction_id',
        'response_payload',
    ];

    protected $casts = [
        'amount' => 'decimal:2',
        'response_payload' => 'array',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
