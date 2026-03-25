<?php

namespace App\Services;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class SidebarDataService
{
    public static function getSidebarCounts(): object
    {
        try {
            $userCounts = DB::table('users')
                ->whereNull('deleted_at')
                ->selectRaw('
                    COUNT(CASE WHEN status = 1 THEN 1 END) as active_users,
                    COUNT(CASE WHEN status = 0 THEN 1 END) as blocked_users,
                    COUNT(CASE WHEN email_verification = 0 THEN 1 END) as email_unverified,
                    COUNT(CASE WHEN sms_verification = 0 THEN 1 END) as sms_unverified
                ')
                ->first();

            $kycCounts = DB::table('user_kycs')
                ->join('users', 'user_kycs.user_id', '=', 'users.id')
                ->whereNull('users.deleted_at')
                ->selectRaw('
                    COUNT(CASE WHEN user_kycs.status = 0 THEN 1 END) as kyc_pending,
                    COUNT(CASE WHEN user_kycs.status = 1 THEN 1 END) as kyc_verified,
                    COUNT(CASE WHEN user_kycs.status = 2 THEN 1 END) as kyc_rejected
                ')
                ->first();

            $supportTicketCounts = DB::table('support_tickets')
                ->join('users', 'support_tickets.user_id', '=', 'users.id')
                ->whereNull('users.deleted_at')
                ->selectRaw('
                   COUNT(CASE WHEN support_tickets.status = 0 THEN 1 END) as ticket_pending
                ')
                ->first();


            $depositCounts = DB::table('deposits')
                ->select([
                    DB::raw('COUNT(CASE WHEN status = 2 THEN 1 END) as deposit_pending'),
                    DB::raw('COUNT(CASE WHEN status = 3 THEN 1 END) as deposit_rejected')
                ])
                ->first();

            return (object)array_merge((array)$userCounts, (array)$kycCounts, (array)$depositCounts);

        } catch (\Throwable $e) {
            Log::error('Error fetching sidebar counts: ' . $e->getMessage());
            return (object)[
                'active_users' => 0,
                'blocked_users' => 0,
                'email_unverified' => 0,
                'sms_unverified' => 0,
                'kyc_pending' => 0,
                'kyc_verified' => 0,
                'kyc_rejected' => 0,
                'deposit_pending' => 0,
                'deposit_rejected' => 0,
            ];
        }

    }
}
