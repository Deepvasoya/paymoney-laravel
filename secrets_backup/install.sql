-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 02:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waiz_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `two_fa` tinyint(4) NOT NULL DEFAULT 0,
  `two_fa_verify` tinyint(4) NOT NULL DEFAULT 1,
  `two_fa_code` varchar(255) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `admin_access` text DEFAULT NULL,
  `last_login` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `password`, `two_fa`, `two_fa_verify`, `two_fa_code`, `image`, `image_driver`, `phone`, `address`, `admin_access`, `last_login`, `status`, `remember_token`, `last_seen`, `created_at`, `updated_at`) VALUES
(1, 'Danber MaZud', 'admin', 'admin@gmail.com', '$2a$12$PdGoWWk/0pF256zeELw3Ke/9MLziP6NSeyL7Fx.rocHOKuKNklwDe', 0, 1, 'NOSSNCLPJEWBJI3P', 'adminProfileImage/6CKlyJJWxoCn8AGyXFuYHHcfi7xvmP.avif', 'local', '+1627839900', 'NY, USA', NULL, '2024-12-09 18:12:55', 1, 'dfYCJouDXUqu6IO1bl8CA6DMpYhut4fU4jnC0agJMkCwY3QYFxih4WKN4EbE', '2024-12-09 19:41:57', NULL, '2024-12-09 13:41:57');

-- --------------------------------------------------------

--
-- Table structure for table `basic_controls`
--

CREATE TABLE `basic_controls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `primary_color` varchar(50) DEFAULT NULL,
  `secondary_color` varchar(50) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `base_currency` varchar(20) DEFAULT NULL,
  `currency_symbol` varchar(20) DEFAULT NULL,
  `currency_rate` decimal(18,8) DEFAULT 0.00000000,
  `admin_prefix` varchar(191) DEFAULT NULL,
  `is_currency_position` varchar(191) NOT NULL DEFAULT 'left' COMMENT 'left, right',
  `has_space_between_currency_and_amount` tinyint(1) NOT NULL DEFAULT 0,
  `is_force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `paginate` int(11) DEFAULT NULL,
  `strong_password` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0,
  `fraction_number` int(11) DEFAULT NULL,
  `sender_email` varchar(255) DEFAULT NULL,
  `sender_email_name` varchar(255) DEFAULT NULL,
  `email_description` text DEFAULT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT 0,
  `in_app_notification` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active',
  `email_notification` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_notification` tinyint(1) NOT NULL DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 0,
  `tawk_id` varchar(255) DEFAULT NULL,
  `tawk_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_messenger_status` tinyint(1) NOT NULL DEFAULT 0,
  `fb_app_id` varchar(255) DEFAULT NULL,
  `fb_page_id` varchar(255) DEFAULT NULL,
  `manual_recaptcha` tinyint(1) DEFAULT 0 COMMENT '0 =>inactive, 1 => active ',
  `google_recaptcha` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>inactive, 1 =>active',
  `manual_recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => inactive, 1 => active ',
  `manual_recaptcha_login` tinyint(1) DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `manual_recaptcha_register` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = inactive, 1 = active',
  `google_recaptcha_admin_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =>inactive, 1 => active	',
  `google_recaptcha_login` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =>inactive, 1 => active	',
  `google_recaptcha_register` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =>inactive, 1 => active	',
  `measurement_id` varchar(255) DEFAULT NULL,
  `analytic_status` tinyint(1) DEFAULT NULL,
  `error_log` tinyint(1) DEFAULT NULL,
  `is_active_cron_notification` tinyint(1) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_driver` varchar(20) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `favicon_driver` varchar(20) DEFAULT NULL,
  `admin_logo` varchar(255) DEFAULT NULL,
  `admin_logo_driver` varchar(20) DEFAULT NULL,
  `admin_dark_mode_logo` varchar(255) DEFAULT NULL,
  `admin_dark_mode_logo_driver` varchar(50) DEFAULT NULL,
  `currency_layer_access_key` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update_at` varchar(255) DEFAULT NULL,
  `currency_layer_auto_update` varchar(1) DEFAULT NULL,
  `coin_market_cap_app_key` varchar(255) DEFAULT NULL,
  `coin_market_cap_auto_update_at` varchar(255) NOT NULL,
  `coin_market_cap_auto_update` tinyint(1) DEFAULT NULL,
  `automatic_payout_permission` tinyint(1) NOT NULL DEFAULT 0,
  `date_time_format` varchar(255) DEFAULT NULL,
  `virtual_card` tinyint(20) DEFAULT NULL COMMENT '0=>off,1=>on',
  `v_card_multiple` tinyint(20) DEFAULT NULL COMMENT '0=>off,1=>on',
  `v_card_charge` double(10,2) DEFAULT NULL,
  `min_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `max_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `min_transfer_fee` decimal(18,2) NOT NULL DEFAULT 0.00,
  `max_transfer_fee` decimal(18,2) NOT NULL DEFAULT 0.00,
  `refer_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>Active, 0=>Inactive',
  `refer_title` varchar(255) DEFAULT NULL,
  `refer_earn_amount` decimal(18,2) DEFAULT NULL,
  `refer_free_transfer` decimal(18,2) DEFAULT NULL,
  `cookie_status` int(11) NOT NULL DEFAULT 0,
  `cookie_title` varchar(255) DEFAULT NULL,
  `cookie_sub_title` varchar(255) DEFAULT NULL,
  `cookie_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basic_controls`
--

INSERT INTO `basic_controls` (`id`, `theme`, `site_title`, `primary_color`, `secondary_color`, `time_zone`, `base_currency`, `currency_symbol`, `currency_rate`, `admin_prefix`, `is_currency_position`, `has_space_between_currency_and_amount`, `is_force_ssl`, `is_maintenance_mode`, `paginate`, `strong_password`, `registration`, `fraction_number`, `sender_email`, `sender_email_name`, `email_description`, `push_notification`, `in_app_notification`, `email_notification`, `email_verification`, `sms_notification`, `sms_verification`, `tawk_id`, `tawk_status`, `fb_messenger_status`, `fb_app_id`, `fb_page_id`, `manual_recaptcha`, `google_recaptcha`, `manual_recaptcha_admin_login`, `manual_recaptcha_login`, `manual_recaptcha_register`, `google_recaptcha_admin_login`, `google_recaptcha_login`, `google_recaptcha_register`, `measurement_id`, `analytic_status`, `error_log`, `is_active_cron_notification`, `logo`, `logo_driver`, `favicon`, `favicon_driver`, `admin_logo`, `admin_logo_driver`, `admin_dark_mode_logo`, `admin_dark_mode_logo_driver`, `currency_layer_access_key`, `currency_layer_auto_update_at`, `currency_layer_auto_update`, `coin_market_cap_app_key`, `coin_market_cap_auto_update_at`, `coin_market_cap_auto_update`, `automatic_payout_permission`, `date_time_format`, `virtual_card`, `v_card_multiple`, `v_card_charge`, `min_amount`, `max_amount`, `min_transfer_fee`, `max_transfer_fee`, `refer_status`, `refer_title`, `refer_earn_amount`, `refer_free_transfer`, `cookie_status`, `cookie_title`, `cookie_sub_title`, `cookie_url`, `created_at`, `updated_at`) VALUES
(1, 'light', 'Waiz', '#98b11f', '#26282c', 'Asia/Dhaka', 'USD', '$', 1.00000000, 'admin', 'right', 1, 0, 0, 10, 0, 1, 2, 'admin@bugfinder.net', 'Bug Admin', '<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n<meta name=\"viewport\" content=\"width=device-width\">\n<style type=\"text/css\">\n    @media only screen and (min-width: 620px) {\n        * [lang=x-wrapper] h1 {\n        }\n\n        * [lang=x-wrapper] h1 {\n            font-size: 26px !important;\n            line-height: 34px !important\n        }\n\n        * [lang=x-wrapper] h2 {\n        }\n\n        * [lang=x-wrapper] h2 {\n            font-size: 20px !important;\n            line-height: 28px !important\n        }\n\n        * [lang=x-wrapper] h3 {\n        }\n\n        * [lang=x-layout__inner] p,\n        * [lang=x-layout__inner] ol,\n        * [lang=x-layout__inner] ul {\n        }\n\n        * div [lang=x-size-8] {\n            font-size: 8px !important;\n            line-height: 14px !important\n        }\n\n        * div [lang=x-size-9] {\n            font-size: 9px !important;\n            line-height: 16px !important\n        }\n\n        * div [lang=x-size-10] {\n            font-size: 10px !important;\n            line-height: 18px !important\n        }\n\n        * div [lang=x-size-11] {\n            font-size: 11px !important;\n            line-height: 19px !important\n        }\n\n        * div [lang=x-size-12] {\n            font-size: 12px !important;\n            line-height: 19px !important\n        }\n\n        * div [lang=x-size-13] {\n            font-size: 13px !important;\n            line-height: 21px !important\n        }\n\n        * div [lang=x-size-14] {\n            font-size: 14px !important;\n            line-height: 21px !important\n        }\n\n        * div [lang=x-size-15] {\n            font-size: 15px !important;\n            line-height: 23px !important\n        }\n\n        * div [lang=x-size-16] {\n            font-size: 16px !important;\n            line-height: 24px !important\n        }\n\n        * div [lang=x-size-17] {\n            font-size: 17px !important;\n            line-height: 26px !important\n        }\n\n        * div [lang=x-size-18] {\n            font-size: 18px !important;\n            line-height: 26px !important\n        }\n\n        * div [lang=x-size-18] {\n            font-size: 18px !important;\n            line-height: 26px !important\n        }\n\n        * div [lang=x-size-20] {\n            font-size: 20px !important;\n            line-height: 28px !important\n        }\n\n        * div [lang=x-size-22] {\n            font-size: 22px !important;\n            line-height: 31px !important\n        }\n\n        * div [lang=x-size-24] {\n            font-size: 24px !important;\n            line-height: 32px !important\n        }\n\n        * div [lang=x-size-26] {\n            font-size: 26px !important;\n            line-height: 34px !important\n        }\n\n        * div [lang=x-size-28] {\n            font-size: 28px !important;\n            line-height: 36px !important\n        }\n\n        * div [lang=x-size-30] {\n            font-size: 30px !important;\n            line-height: 38px !important\n        }\n\n        * div [lang=x-size-32] {\n            font-size: 32px !important;\n            line-height: 40px !important\n        }\n\n        * div [lang=x-size-34] {\n            font-size: 34px !important;\n            line-height: 43px !important\n        }\n\n        * div [lang=x-size-36] {\n            font-size: 36px !important;\n            line-height: 43px !important\n        }\n\n        * div [lang=x-size-40] {\n            font-size: 40px !important;\n            line-height: 47px !important\n        }\n\n        * div [lang=x-size-44] {\n            font-size: 44px !important;\n            line-height: 50px !important\n        }\n\n        * div [lang=x-size-48] {\n            font-size: 48px !important;\n            line-height: 54px !important\n        }\n\n        * div [lang=x-size-56] {\n            font-size: 56px !important;\n            line-height: 60px !important\n        }\n\n        * div [lang=x-size-64] {\n            font-size: 64px !important;\n            line-height: 63px !important\n        }\n    }\n</style>\n<style type=\"text/css\">\n    body {\n        margin: 0;\n        padding: 0;\n    }\n\n    table {\n        border-collapse: collapse;\n        table-layout: fixed;\n    }\n\n    * {\n        line-height: inherit;\n    }\n\n    [x-apple-data-detectors],\n    [href^=\"tel\"],\n    [href^=\"sms\"] {\n        color: inherit !important;\n        text-decoration: none !important;\n    }\n\n    .wrapper .footer__share-button a:hover,\n    .wrapper .footer__share-button a:focus {\n        color: #ffffff !important;\n    }\n\n    .btn a:hover,\n    .btn a:focus,\n    .footer__share-button a:hover,\n    .footer__share-button a:focus,\n    .email-footer__links a:hover,\n    .email-footer__links a:focus {\n        opacity: 0.8;\n    }\n\n    .preheader,\n    .header,\n    .layout,\n    .column {\n        transition: width 0.25s ease-in-out, max-width 0.25s ease-in-out;\n    }\n\n    .layout,\n    .header {\n        max-width: 400px !important;\n        -fallback-width: 95% !important;\n        width: calc(100% - 20px) !important;\n    }\n\n    div.preheader {\n        max-width: 360px !important;\n        -fallback-width: 90% !important;\n        width: calc(100% - 60px) !important;\n    }\n\n    .snippet,\n    .webversion {\n        Float: none !important;\n    }\n\n    .column {\n        max-width: 400px !important;\n        width: 100% !important;\n    }\n\n    .fixed-width.has-border {\n        max-width: 402px !important;\n    }\n\n    .fixed-width.has-border .layout__inner {\n        box-sizing: border-box;\n    }\n\n    .snippet,\n    .webversion {\n        width: 50% !important;\n    }\n\n    .ie .btn {\n        width: 100%;\n    }\n\n    .ie .column,\n    [owa] .column,\n    .ie .gutter,\n    [owa] .gutter {\n        display: table-cell;\n        float: none !important;\n        vertical-align: top;\n    }\n\n    .ie div.preheader,\n    [owa] div.preheader,\n    .ie .email-footer,\n    [owa] .email-footer {\n        max-width: 560px !important;\n        width: 560px !important;\n    }\n\n    .ie .snippet,\n    [owa] .snippet,\n    .ie .webversion,\n    [owa] .webversion {\n        width: 280px !important;\n    }\n\n    .ie .header,\n    [owa] .header,\n    .ie .layout,\n    [owa] .layout,\n    .ie .one-col .column,\n    [owa] .one-col .column {\n        max-width: 600px !important;\n        width: 600px !important;\n    }\n\n    .ie .fixed-width.has-border,\n    [owa] .fixed-width.has-border,\n    .ie .has-gutter.has-border,\n    [owa] .has-gutter.has-border {\n        max-width: 602px !important;\n        width: 602px !important;\n    }\n\n    .ie .two-col .column,\n    [owa] .two-col .column {\n        width: 300px !important;\n    }\n\n    .ie .three-col .column,\n    [owa] .three-col .column,\n    .ie .narrow,\n    [owa] .narrow {\n        width: 200px !important;\n    }\n\n    .ie .wide,\n    [owa] .wide {\n        width: 400px !important;\n    }\n\n    .ie .two-col.has-gutter .column,\n    [owa] .two-col.x_has-gutter .column {\n        width: 290px !important;\n    }\n\n    .ie .three-col.has-gutter .column,\n    [owa] .three-col.x_has-gutter .column,\n    .ie .has-gutter .narrow,\n    [owa] .has-gutter .narrow {\n        width: 188px !important;\n    }\n\n    .ie .has-gutter .wide,\n    [owa] .has-gutter .wide {\n        width: 394px !important;\n    }\n\n    .ie .two-col.has-gutter.has-border .column,\n    [owa] .two-col.x_has-gutter.x_has-border .column {\n        width: 292px !important;\n    }\n\n    .ie .three-col.has-gutter.has-border .column,\n    [owa] .three-col.x_has-gutter.x_has-border .column,\n    .ie .has-gutter.has-border .narrow,\n    [owa] .has-gutter.x_has-border .narrow {\n        width: 190px !important;\n    }\n\n    .ie .has-gutter.has-border .wide,\n    [owa] .has-gutter.x_has-border .wide {\n        width: 396px !important;\n    }\n\n    .ie .fixed-width .layout__inner {\n        border-left: 0 none white !important;\n        border-right: 0 none white !important;\n    }\n\n    .ie .layout__edges {\n        display: none;\n    }\n\n    .mso .layout__edges {\n        font-size: 0;\n    }\n\n    .layout-fixed-width,\n    .mso .layout-full-width {\n        background-color: #ffffff;\n    }\n\n    @media only screen and (min-width: 620px) {\n\n        .column,\n        .gutter {\n            display: table-cell;\n            Float: none !important;\n            vertical-align: top;\n        }\n\n        div.preheader,\n        .email-footer {\n            max-width: 560px !important;\n            width: 560px !important;\n        }\n\n        .snippet,\n        .webversion {\n            width: 280px !important;\n        }\n\n        .header,\n        .layout,\n        .one-col .column {\n            max-width: 600px !important;\n            width: 600px !important;\n        }\n\n        .fixed-width.has-border,\n        .fixed-width.ecxhas-border,\n        .has-gutter.has-border,\n        .has-gutter.ecxhas-border {\n            max-width: 602px !important;\n            width: 602px !important;\n        }\n\n        .two-col .column {\n            width: 300px !important;\n        }\n\n        .three-col .column,\n        .column.narrow {\n            width: 200px !important;\n        }\n\n        .column.wide {\n            width: 400px !important;\n        }\n\n        .two-col.has-gutter .column,\n        .two-col.ecxhas-gutter .column {\n            width: 290px !important;\n        }\n\n        .three-col.has-gutter .column,\n        .three-col.ecxhas-gutter .column,\n        .has-gutter .narrow {\n            width: 188px !important;\n        }\n\n        .has-gutter .wide {\n            width: 394px !important;\n        }\n\n        .two-col.has-gutter.has-border .column,\n        .two-col.ecxhas-gutter.ecxhas-border .column {\n            width: 292px !important;\n        }\n\n        .three-col.has-gutter.has-border .column,\n        .three-col.ecxhas-gutter.ecxhas-border .column,\n        .has-gutter.has-border .narrow,\n        .has-gutter.ecxhas-border .narrow {\n            width: 190px !important;\n        }\n\n        .has-gutter.has-border .wide,\n        .has-gutter.ecxhas-border .wide {\n            width: 396px !important;\n        }\n    }\n\n    @media only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx) {\n        .fblike {\n            background-image: url(https://i3.createsend1.com/static/eb/customise/13-the-blueprint-3/images/fblike@2x.png) !important;\n        }\n\n        .tweet {\n            background-image: url(https://i4.createsend1.com/static/eb/customise/13-the-blueprint-3/images/tweet@2x.png) !important;\n        }\n\n        .linkedinshare {\n            background-image: url(https://i6.createsend1.com/static/eb/customise/13-the-blueprint-3/images/lishare@2x.png) !important;\n        }\n\n        .forwardtoafriend {\n            background-image: url(https://i5.createsend1.com/static/eb/customise/13-the-blueprint-3/images/forward@2x.png) !important;\n        }\n    }\n\n    @media (max-width: 321px) {\n        .fixed-width.has-border .layout__inner {\n            border-width: 1px 0 !important;\n        }\n\n        .layout,\n        .column {\n            min-width: 320px !important;\n            width: 320px !important;\n        }\n\n        .border {\n            display: none;\n        }\n    }\n\n    .mso div {\n        border: 0 none white !important;\n    }\n\n    .mso .w560 .divider {\n        margin-left: 260px !important;\n        margin-right: 260px !important;\n    }\n\n    .mso .w360 .divider {\n        margin-left: 160px !important;\n        margin-right: 160px !important;\n    }\n\n    .mso .w260 .divider {\n        margin-left: 110px !important;\n        margin-right: 110px !important;\n    }\n\n    .mso .w160 .divider {\n        margin-left: 60px !important;\n        margin-right: 60px !important;\n    }\n\n    .mso .w354 .divider {\n        margin-left: 157px !important;\n        margin-right: 157px !important;\n    }\n\n    .mso .w250 .divider {\n        margin-left: 105px !important;\n        margin-right: 105px !important;\n    }\n\n    .mso .w148 .divider {\n        margin-left: 54px !important;\n        margin-right: 54px !important;\n    }\n\n    .mso .font-avenir,\n    .mso .font-cabin,\n    .mso .font-open-sans,\n    .mso .font-ubuntu {\n        font-family: sans-serif !important;\n    }\n\n    .mso .font-bitter,\n    .mso .font-merriweather,\n    .mso .font-pt-serif {\n        font-family: Georgia, serif !important;\n    }\n\n    .mso .font-lato,\n    .mso .font-roboto {\n        font-family: Tahoma, sans-serif !important;\n    }\n\n    .mso .font-pt-sans {\n        font-family: \"Trebuchet MS\", sans-serif !important;\n    }\n\n    .mso .footer__share-button p {\n        margin: 0;\n    }\n\n    @media only screen and (min-width: 620px) {\n        .wrapper .size-8 {\n            font-size: 8px !important;\n            line-height: 14px !important;\n        }\n\n        .wrapper .size-9 {\n            font-size: 9px !important;\n            line-height: 16px !important;\n        }\n\n        .wrapper .size-10 {\n            font-size: 10px !important;\n            line-height: 18px !important;\n        }\n\n        .wrapper .size-11 {\n            font-size: 11px !important;\n            line-height: 19px !important;\n        }\n\n        .wrapper .size-12 {\n            font-size: 12px !important;\n            line-height: 19px !important;\n        }\n\n        .wrapper .size-13 {\n            font-size: 13px !important;\n            line-height: 21px !important;\n        }\n\n        .wrapper .size-14 {\n            font-size: 14px !important;\n            line-height: 21px !important;\n        }\n\n        .wrapper .size-15 {\n            font-size: 15px !important;\n            line-height: 23px !important;\n        }\n\n        .wrapper .size-16 {\n            font-size: 16px !important;\n            line-height: 24px !important;\n        }\n\n        .wrapper .size-17 {\n            font-size: 17px !important;\n            line-height: 26px !important;\n        }\n\n        .wrapper .size-18 {\n            font-size: 18px !important;\n            line-height: 26px !important;\n        }\n\n        .wrapper .size-20 {\n            font-size: 20px !important;\n            line-height: 28px !important;\n        }\n\n        .wrapper .size-22 {\n            font-size: 22px !important;\n            line-height: 31px !important;\n        }\n\n        .wrapper .size-24 {\n            font-size: 24px !important;\n            line-height: 32px !important;\n        }\n\n        .wrapper .size-26 {\n            font-size: 26px !important;\n            line-height: 34px !important;\n        }\n\n        .wrapper .size-28 {\n            font-size: 28px !important;\n            line-height: 36px !important;\n        }\n\n        .wrapper .size-30 {\n            font-size: 30px !important;\n            line-height: 38px !important;\n        }\n\n        .wrapper .size-32 {\n            font-size: 32px !important;\n            line-height: 40px !important;\n        }\n\n        .wrapper .size-34 {\n            font-size: 34px !important;\n            line-height: 43px !important;\n        }\n\n        .wrapper .size-36 {\n            font-size: 36px !important;\n            line-height: 43px !important;\n        }\n\n        .wrapper .size-40 {\n            font-size: 40px !important;\n            line-height: 47px !important;\n        }\n\n        .wrapper .size-44 {\n            font-size: 44px !important;\n            line-height: 50px !important;\n        }\n\n        .wrapper .size-48 {\n            font-size: 48px !important;\n            line-height: 54px !important;\n        }\n\n        .wrapper .size-56 {\n            font-size: 56px !important;\n            line-height: 60px !important;\n        }\n\n        .wrapper .size-64 {\n            font-size: 64px !important;\n            line-height: 63px !important;\n        }\n    }\n\n    .mso .size-8,\n    .ie .size-8 {\n        font-size: 8px !important;\n        line-height: 14px !important;\n    }\n\n    .mso .size-9,\n    .ie .size-9 {\n        font-size: 9px !important;\n        line-height: 16px !important;\n    }\n\n    .mso .size-10,\n    .ie .size-10 {\n        font-size: 10px !important;\n        line-height: 18px !important;\n    }\n\n    .mso .size-11,\n    .ie .size-11 {\n        font-size: 11px !important;\n        line-height: 19px !important;\n    }\n\n    .mso .size-12,\n    .ie .size-12 {\n        font-size: 12px !important;\n        line-height: 19px !important;\n    }\n\n    .mso .size-13,\n    .ie .size-13 {\n        font-size: 13px !important;\n        line-height: 21px !important;\n    }\n\n    .mso .size-14,\n    .ie .size-14 {\n        font-size: 14px !important;\n        line-height: 21px !important;\n    }\n\n    .mso .size-15,\n    .ie .size-15 {\n        font-size: 15px !important;\n        line-height: 23px !important;\n    }\n\n    .mso .size-16,\n    .ie .size-16 {\n        font-size: 16px !important;\n        line-height: 24px !important;\n    }\n\n    .mso .size-17,\n    .ie .size-17 {\n        font-size: 17px !important;\n        line-height: 26px !important;\n    }\n\n    .mso .size-18,\n    .ie .size-18 {\n        font-size: 18px !important;\n        line-height: 26px !important;\n    }\n\n    .mso .size-20,\n    .ie .size-20 {\n        font-size: 20px !important;\n        line-height: 28px !important;\n    }\n\n    .mso .size-22,\n    .ie .size-22 {\n        font-size: 22px !important;\n        line-height: 31px !important;\n    }\n\n    .mso .size-24,\n    .ie .size-24 {\n        font-size: 24px !important;\n        line-height: 32px !important;\n    }\n\n    .mso .size-26,\n    .ie .size-26 {\n        font-size: 26px !important;\n        line-height: 34px !important;\n    }\n\n    .mso .size-28,\n    .ie .size-28 {\n        font-size: 28px !important;\n        line-height: 36px !important;\n    }\n\n    .mso .size-30,\n    .ie .size-30 {\n        font-size: 30px !important;\n        line-height: 38px !important;\n    }\n\n    .mso .size-32,\n    .ie .size-32 {\n        font-size: 32px !important;\n        line-height: 40px !important;\n    }\n\n    .mso .size-34,\n    .ie .size-34 {\n        font-size: 34px !important;\n        line-height: 43px !important;\n    }\n\n    .mso .size-36,\n    .ie .size-36 {\n        font-size: 36px !important;\n        line-height: 43px !important;\n    }\n\n    .mso .size-40,\n    .ie .size-40 {\n        font-size: 40px !important;\n        line-height: 47px !important;\n    }\n\n    .mso .size-44,\n    .ie .size-44 {\n        font-size: 44px !important;\n        line-height: 50px !important;\n    }\n\n    .mso .size-48,\n    .ie .size-48 {\n        font-size: 48px !important;\n        line-height: 54px !important;\n    }\n\n    .mso .size-56,\n    .ie .size-56 {\n        font-size: 56px !important;\n        line-height: 60px !important;\n    }\n\n    .mso .size-64,\n    .ie .size-64 {\n        font-size: 64px !important;\n        line-height: 63px !important;\n    }\n\n    .footer__share-button p {\n        margin: 0;\n    }\n</style>\n\n<title></title>\n<!--[if !mso]><!-->\n<style type=\"text/css\">\n    @import url(https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400);\n</style>\n<link href=\"https://fonts.googleapis.com/css?family=Bitter:400,700,400italic|Cabin:400,700,400italic,700italic|Open+Sans:400italic,700italic,700,400\" rel=\"stylesheet\" type=\"text/css\">\n<!--<![endif]-->\n<style type=\"text/css\">\n    body {\n        background-color: #f5f7fa\n    }\n\n    .mso h1 {\n    }\n\n    .mso h1 {\n        font-family: sans-serif !important\n    }\n\n    .mso h2 {\n    }\n\n    .mso h3 {\n    }\n\n    .mso .column,\n    .mso .column__background td {\n    }\n\n    .mso .column,\n    .mso .column__background td {\n        font-family: sans-serif !important\n    }\n\n    .mso .btn a {\n    }\n\n    .mso .btn a {\n        font-family: sans-serif !important\n    }\n\n    .mso .webversion,\n    .mso .snippet,\n    .mso .layout-email-footer td,\n    .mso .footer__share-button p {\n    }\n\n    .mso .webversion,\n    .mso .snippet,\n    .mso .layout-email-footer td,\n    .mso .footer__share-button p {\n        font-family: sans-serif !important\n    }\n\n    .mso .logo {\n    }\n\n    .mso .logo {\n        font-family: Tahoma, sans-serif !important\n    }\n\n    .logo a:hover,\n    .logo a:focus {\n        color: #859bb1 !important\n    }\n\n    .mso .layout-has-border {\n        border-top: 1px solid #b1c1d8;\n        border-bottom: 1px solid #b1c1d8\n    }\n\n    .mso .layout-has-bottom-border {\n        border-bottom: 1px solid #b1c1d8\n    }\n\n    .mso .border,\n    .ie .border {\n        background-color: #b1c1d8\n    }\n\n    @media only screen and (min-width: 620px) {\n        .wrapper h1 {\n        }\n\n        .wrapper h1 {\n            font-size: 26px !important;\n            line-height: 34px !important\n        }\n\n        .wrapper h2 {\n        }\n\n        .wrapper h2 {\n            font-size: 20px !important;\n            line-height: 28px !important\n        }\n\n        .wrapper h3 {\n        }\n\n        .column p,\n        .column ol,\n        .column ul {\n        }\n    }\n\n    .mso h1,\n    .ie h1 {\n    }\n\n    .mso h1,\n    .ie h1 {\n        font-size: 26px !important;\n        line-height: 34px !important\n    }\n\n    .mso h2,\n    .ie h2 {\n    }\n\n    .mso h2,\n    .ie h2 {\n        font-size: 20px !important;\n        line-height: 28px !important\n    }\n\n    .mso h3,\n    .ie h3 {\n    }\n\n    .mso .layout__inner p,\n    .ie .layout__inner p,\n    .mso .layout__inner ol,\n    .ie .layout__inner ol,\n    .mso .layout__inner ul,\n    .ie .layout__inner ul {\n    }\n</style>\n<meta name=\"robots\" content=\"noindex,nofollow\">\n\n<meta property=\"og:title\" content=\"Just One More Step\">\n\n<link href=\"https://css.createsend1.com/css/social.min.css?h=0ED47CE120160920\" media=\"screen,projection\" rel=\"stylesheet\" type=\"text/css\">\n\n\n<div class=\"wrapper\" style=\"min-width: 320px;background-color: #f5f7fa;\" lang=\"x-wrapper\">\n    <div class=\"preheader\" style=\"margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;\">\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\n            </div>\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\n            </div>\n        </div>\n\n        <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #c4e5dc;\" lang=\"x-layout__inner\">\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\n                    <div style=\"margin-left: 20px;margin-right: 20px;margin-top: 24px;margin-bottom: 24px;\">\n                        <h1 style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #44a8c7;font-size: 36px;line-height: 43px;font-family: bitter,georgia,serif;text-align: center;\">\n                            <img style=\"width: 200px;\" src=\"https://bug-finder.s3.ap-southeast-1.amazonaws.com/assets/logo/header-logo.svg\" data-filename=\"imageedit_76_3542310111.png\"></h1>\n                    </div>\n                </div>\n            </div>\n\n            <div class=\"layout one-col fixed-width\" style=\"margin: 0 auto;max-width: 600px;min-width: 320px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\n                <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\" lang=\"x-layout__inner\">\n                    <div class=\"column\" style=\"text-align: left; background: rgb(237, 241, 235); line-height: 21px; max-width: 600px; min-width: 320px; width: 320px;\">\n\n                        <div style=\"color: rgb(96, 102, 109); font-size: 14px; margin-left: 20px; margin-right: 20px; margin-top: 24px;\">\n                            <div style=\"line-height:10px;font-size:1px\">&nbsp;</div>\n                        </div>\n\n                        <div style=\"margin-left: 20px; margin-right: 20px;\">\n\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 16px; margin-bottom: 0px;\"><strong>Hello [[name]],</strong></p>\n                            <p style=\"color: rgb(96, 102, 109); font-size: 14px; margin-top: 20px; margin-bottom: 20px;\"><strong>[[message]]</strong></p>\n                            <p style=\"margin-top: 20px; margin-bottom: 20px;\"><strong style=\"color: rgb(96, 102, 109); font-size: 14px;\">Sincerely,<br>Team&nbsp;</strong><font color=\"#60666d\"><b>WAIZ</b></font></p>\n                        </div>\n\n                    </div>\n                </div>\n            </div>\n\n            <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #2c3262; margin-bottom: 20px\" lang=\"x-layout__inner\">\n                <div class=\"column\" style=\"text-align: left;color: #60666d;font-size: 14px;line-height: 21px;max-width:600px;min-width:320px;\">\n                    <div style=\"margin-top: 5px;margin-bottom: 5px;\">\n                        <p style=\"margin-top: 0;margin-bottom: 0;font-style: normal;font-weight: normal;color: #ffffff;font-size: 16px;line-height: 35px;font-family: bitter,georgia,serif;text-align: center;\">\n                            2024 ©  All Right Reserved</p>\n                    </div>\n                </div>\n            </div>\n\n        </div>\n\n\n        <div style=\"border-collapse: collapse;display: table;width: 100%;\">\n            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;padding: 10px 0 5px 0;color: #b9b9b9;\">\n            </div>\n            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;padding: 10px 0 5px 0;text-align: right;color: #b9b9b9;\">\n            </div>\n        </div>\n    </div>\n</div>', 0, 0, 0, 0, 0, 0, 'OSLDSF465', 0, 0, 'KLSDKF789', '654646977', 1, 0, 0, 0, 1, 0, 1, 1, 'aaaaaa', 0, 0, 0, 'logo/4HVH3JeDRlGdQ44yFFnrL7hvfkMBIE.webp', 'local', 'logo/A0QhZokdpliGoja89gSVc9rXHDFomR.webp', 'local', 'logo/NZlFHKdZXtcE8U5wLEc5Wk1mCJjpNf.webp', 'local', 'logo/i9L9faJYDpIUOo3pAukBfdwCNi7z80.webp', 'local', 'a7b7449c93d2e4bfffc7050b20a2c11', 'everyMinute', '1', NULL, '', NULL, 0, 'd.m.Y', NULL, 1, 10.00, 15.00, 10000.00, 2.50, 15.00, 0, 'INVITE AND GET $50', 50.00, 500.00, 1, 'We use cookies!', 'We use cookies to ensure that give you the best experience on your website', 'http://localhost/CoinShift/cookie-policy', '2023-06-13 18:35:41', '2024-12-09 12:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `blog_image` varchar(255) DEFAULT NULL,
  `blog_image_driver` varchar(255) DEFAULT NULL,
  `author_image` varchar(255) DEFAULT NULL,
  `author_image_driver` varchar(255) DEFAULT NULL,
  `breadcrumb_status` tinyint(4) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `blog_image`, `blog_image_driver`, `author_image`, `author_image_driver`, `breadcrumb_status`, `breadcrumb_image`, `breadcrumb_image_driver`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'blog/cVluljJEdjhEl6s99w1scvjL0QHnNT.webp', 'local', 'blog/3o9NlSdabMiqDHaKGY8ZDII1t2VgtY.avif', 'local', 1, 'breadcrumb/tWKcfBfn5dPmXD6Q4jTETkQ504PCZd.avif', 'local', 1, '2023-12-12 12:51:06', '2024-07-08 10:57:32'),
(3, 1, 'blog/Gu6gk9k7fwdwAZBQaYhZrYfI3G3vRU.avif', 'local', 'blog/zfp4OBV7RTaR8Y87Ojn7poyzjmdAV2.avif', 'local', 1, 'blog/E0bb4oca3bYJBp65hWnB9alZlgvSgU.avif', 'local', 1, '2023-12-13 07:08:34', '2024-07-02 10:34:08'),
(5, 7, 'blog/1KultkUhdNwJ5dkqA0Ink9rg8H3CrC.webp', 'local', 'blog/eUo0EOtQTdSCqajUVx5LKy0vxd484z.avif', 'local', 1, 'blog/ZPW0y14Uuasobyqv4RlYv0nXcS03Bb.avif', 'local', 1, '2023-12-13 09:32:18', '2024-07-08 10:57:19'),
(6, 1, 'blog/EQYAu302HpnO1lanlmCQG1lIYjiOUX.webp', 'local', 'blog/n6Js856yTeFh0yImyImGqLZYajtMao.avif', 'local', 1, 'blog/qXuahv54YhmPJhB07WEnr0VMIPWtbO.webp', 'local', 1, '2023-12-13 14:17:35', '2024-07-08 10:57:07'),
(11, 8, 'blog/v3Wvs84fJMsK5jr5iF4yMLRQfnWCJH.webp', 'local', 'blog/23d4ONFJ79hPdC3OSzqHPoSqsOxwac.avif', 'local', 1, 'blog/qjK8p6TNCyOSOx3k9ooHOace0u5vej.webp', 'local', 1, '2023-12-14 09:18:54', '2024-07-08 10:56:48'),
(13, 1, 'blog/oCM362MoF3PRuCOIz7rRUSyuWsug2r.webp', 'local', 'blog/e2uuqrggnuEQfzld19NkARIkyohDwX.webp', 'local', 1, 'blog/kdiXQLKIXtjBtP6bIPtVEo2f5CnDVA.webp', 'local', 1, '2024-07-02 12:09:08', '2024-07-08 10:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Business', 1, '2023-12-05 09:43:37', '2023-12-14 09:09:16'),
(3, 'Living Abroad', 1, '2023-12-05 10:59:11', '2023-12-14 09:10:00'),
(7, 'Travel Tips', 1, '2023-12-13 04:39:41', '2023-12-14 09:09:34'),
(8, 'Personal Finance', 1, '2023-12-14 09:11:45', '2023-12-14 09:11:45'),
(12, 'News', 1, '2024-03-19 06:54:37', '2024-03-19 06:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `blog_details`
--

CREATE TABLE `blog_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_details`
--

INSERT INTO `blog_details` (`id`, `blog_id`, `language_id`, `author_name`, `author_title`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 'Steve Osborn', 'Archer', 'Understanding Cross-Border Payment Regulations', 'understanding-cross-border-payment-regulations', '<p>Navigating the complexities of cross-border payment regulations is crucial for businesses and individuals engaged in international transactions. This in-depth guide offers a comprehensive overview of the regulatory landscape, equipping you with the knowledge to ensure compliance and streamline your global financial operations.</p><p>Cross-border payments involve multiple jurisdictions, each with its own set of laws and regulations. Understanding these regulations is essential to avoid legal pitfalls, minimize risks, and ensure the smooth flow of funds across borders. This blog post delves into key aspects of cross-border payment regulations, providing clear explanations and actionable insights.</p><p>Learn about the main regulatory bodies and frameworks governing international payments, including the Financial Action Task Force (FATF), Anti-Money Laundering (AML) regulations, and Know Your Customer (KYC) requirements. Understand the importance of complying with these regulations to prevent fraud, money laundering, and other financial crimes.</p><p>Explore the different types of cross-border payments, such as business-to-business (B2B), business-to-consumer (B2C), and peer-to-peer (P2P) transactions, and the specific regulatory requirements for each. Gain insights into the challenges and best practices for ensuring compliance, from documentation and reporting to transaction monitoring and risk assessment.</p>', '2023-12-12 12:51:06', '2024-07-02 10:37:02'),
(3, 3, 1, 'Eric Hobs', 'Web Developer', 'Managing Currency Risks in International Business', 'managing-currency-risks-international-business', '<p>Navigating currency risks is a critical aspect of conducting international business. This comprehensive guide explores effective strategies and tools to mitigate the impact of exchange rate fluctuations on your bottom line.</p><p>In today\'s interconnected global economy, fluctuations in exchange rates can significantly affect profitability and financial stability. This blog post equips business leaders and financial professionals with essential knowledge to proactively manage currency risks.</p><p>Discover practical hedging techniques, including forward contracts, options, and currency swaps, designed to stabilize cash flows and protect against adverse movements in exchange rates. Learn how to conduct thorough risk assessments, taking into account factors such as market volatility, economic indicators, and geopolitical events that influence currency valuations.</p><p>Explore real-world examples and case studies illustrating successful risk management practices in diverse industries. From multinational corporations to small businesses expanding into international markets, this guide offers tailored insights to suit various organizational needs and risk appetites.</p>', '2023-12-13 07:08:34', '2024-07-02 10:33:33'),
(5, 5, 1, 'Adlof Hitler', 'Engineer', 'Comparing Transfer Methods: Which is Best for Your International Money', 'comparing-transfer-methods-best-international-money-transfer', '<p>Choosing the right method for international money transfers is crucial for efficiency and cost-effectiveness. Our guide compares various transfer methods— from traditional bank transfers to modern fintech solutions— helping you navigate complexities and make informed decisions. Explore pros and cons, fees, speed, and reliability to find the best fit for your financial needs, whether personal or business. Gain clarity on how each method impacts currency conversion rates and regulatory compliance, empowering you to streamline transactions with confidence.</p><p>Choosing the right method for international money transfers is crucial for efficiency and cost-effectiveness. Our guide compares various transfer methods— from traditional bank transfers to modern fintech solutions— helping you navigate complexities and make informed decisions. Explore pros and cons, fees, speed, and reliability to find the best fit for your financial needs, whether personal or business. Gain clarity on how each method impacts currency conversion rates and regulatory compliance, empowering you to streamline transactions with confidence.<br></p>', '2023-12-13 09:32:18', '2024-07-02 10:30:20'),
(6, 6, 1, 'Jaber Masud', 'Web Developer', 'A Comprehensive Guide to International Currency Transfers', 'a-comprehensive-guide-to-international-currency-transfer', '<p>Embarking on international currency transfers involves navigating a myriad of factors, from exchange rates and transfer fees to regulatory requirements and transfer methods. Our comprehensive guide is your ultimate resource, offering in-depth insights and practical advice to master the art of moving money across borders seamlessly and efficiently.</p><p>Whether you\'re a multinational corporation managing global payments or an individual supporting loved ones overseas, this guide covers it all. Discover how to optimize currency conversions, minimize transaction costs, and mitigate risks associated with fluctuating exchange rates. Learn about the various transfer options available, from traditional wire transfers to innovative fintech solutions, and gain a clear understanding of regulatory compliance and documentation essentials.</p><p>Dive into real-world scenarios and case studies that illustrate best practices and common pitfalls to avoid. Explore the impact of digital transformation on international banking and how technologies like blockchain and mobile wallets are reshaping the landscape.</p><p>Empower yourself with the knowledge to make informed decisions that align with your financial goals and operational needs. Whether you\'re seeking to streamline business operations or enhance personal financial management, our guide equips you with the tools and strategies to navigate the global economy confidently.</p><p>Join us on this journey through the intricacies of international currency transfers, and unlock the possibilities of a connected world where borders are no longer barriers to financial prosperity.</p>', '2023-12-13 14:17:35', '2024-12-09 09:29:08'),
(11, 11, 1, 'Tom Holand', 'Architechture', 'Understanding the Future of Digital Wallets: A Look into Waiz', 'understanding-the-future-of-digital-wallets', '<p style=\"color:rgb(69,71,69);font-family:Inter, sans-serif, helvetica, arial, sans-serif;font-size:16px;\">In today’s rapidly evolving digital landscape, the demand for secure, efficient, and user-friendly financial solutions continues to grow. One such innovation making waves in the fintech industry is Waiz, a comprehensive digital wallet and global remittance platform designed to simplify financial transactions across borders.</p><p style=\"color:rgb(69,71,69);font-family:Inter, sans-serif, helvetica, arial, sans-serif;font-size:16px;\"><b>Why Choose Waiz?</b></p><p style=\"color:rgb(69,71,69);font-family:Inter, sans-serif, helvetica, arial, sans-serif;font-size:16px;\">At its core, Waiz offers users a seamless experience for sending and receiving money internationally. Whether you\'re a business looking to streamline payroll processes or an individual sending funds to family abroad, Waiz provides robust features tailored to meet diverse financial needs:</p><p style=\"color:rgb(69,71,69);font-family:Inter, sans-serif, helvetica, arial, sans-serif;font-size:16px;\"><strong>Global Reach:</strong> Waiz facilitates transfers to over 100 countries, leveraging a network of trusted financial partners to ensure reliable and swift transactions.</p><p style=\"color:rgb(69,71,69);font-family:Inter, sans-serif, helvetica, arial, sans-serif;font-size:16px;\"><strong>Security:</strong> With advanced encryption and robust security measures, Waiz prioritizes the safety of user data and transactions, providing peace of mind in an increasingly digital world.</p><p style=\"color:rgb(69,71,69);font-family:Inter, sans-serif, helvetica, arial, sans-serif;font-size:16px;\"><strong>User-Friendly Interface:</strong> Designed with simplicity in mind, Waiz’s intuitive interface makes it easy for users to navigate and manage their finances on the go, whether through the web platform or mobile app.</p>', '2023-12-14 09:18:54', '2024-07-02 10:21:14'),
(13, 11, 2, 'Tom Holand', 'Arquitectura', 'Cómo abrir una cuenta bancaria online: paso a paso', 'understanding-the-future-of-digital-wallets', 'En el panorama digital actual en rápida evolución, la demanda de soluciones financieras seguras, eficientes y fáciles de usar continúa creciendo. Una de esas innovaciones que está causando sensación en la industria de tecnología financiera es Waiz, una billetera digital integral y una plataforma global de remesas diseñada para simplificar las transacciones financieras a través de fronteras.', '2024-05-04 09:34:05', '2024-07-02 10:22:57'),
(14, 6, 2, 'Jaber Masud', 'Web Developer', 'Una guía completa para transferencias internacionales de moneda', 'a-comprehensive-guide-to-international-currency-transfer', '<p>Embarcarse en transferencias internacionales de divisas implica navegar por una gran variedad de factores, desde tipos de cambio y tarifas de transferencia hasta requisitos regulatorios y métodos de transferencia. Nuestra guía completa es su recurso definitivo, ya que ofrece información detallada y consejos prácticos para dominar el arte de mover dinero a través de fronteras de manera fluida y eficiente.</p><p>\r\n</p>\r\nSi usted es una corporación multinacional que gestiona pagos globales o una persona que apoya a sus seres queridos en el extranjero, esta guía lo cubre todo. Descubra cómo optimizar las conversiones de divisas, minimizar los costos de transacción y mitigar los riesgos asociados con las fluctuaciones de los tipos de cambio. Conozca las diversas opciones de transferencia disponibles, desde transferencias bancarias tradicionales hasta soluciones innovadoras de tecnología financiera, y obtenga una comprensión clara del cumplimiento normativo y los elementos esenciales de la documentación.', '2024-07-02 10:28:50', '2024-12-09 09:29:08'),
(15, 5, 2, 'Adlof Hitler', 'Engineer', 'Comparación de métodos de transferencia: cuál es mejor para su dinero internacional', 'comparing-transfer-methods-best-international-money-transfer', '<p>Choosing the right method for international money transfers is crucial for efficiency and cost-effectiveness. Our guide compares various transfer methods— from traditional bank transfers to modern fintech solutions— helping you navigate complexities and make informed decisions. Explore pros and cons, fees, speed, and reliability to find the best fit for your financial needs, whether personal or business. Gain clarity on how each method impacts currency conversion rates and regulatory compliance, empowering you to streamline transactions with confidence.</p><p>Choosing the right method for international money transfers is crucial for efficiency and cost-effectiveness. Our guide compares various transfer methods— from traditional bank transfers to modern fintech solutions— helping you navigate complexities and make informed decisions. Explore pros and cons, fees, speed, and reliability to find the best fit for your financial needs, whether personal or business. Gain clarity on how each method impacts currency conversion rates and regulatory compliance, empowering you to streamline transactions with confidence.<br></p>', '2024-07-02 10:30:46', '2024-07-02 10:30:46'),
(16, 3, 2, 'Eric Hobs', 'Web Developer', 'Gestión de riesgos cambiarios en negocios internacionales', 'managing-currency-risks-international-business', '<p>Navigating currency risks is a critical aspect of conducting international business. This comprehensive guide explores effective strategies and tools to mitigate the impact of exchange rate fluctuations on your bottom line.</p><p>In today\'s interconnected global economy, fluctuations in exchange rates can significantly affect profitability and financial stability. This blog post equips business leaders and financial professionals with essential knowledge to proactively manage currency risks.</p><p>Discover practical hedging techniques, including forward contracts, options, and currency swaps, designed to stabilize cash flows and protect against adverse movements in exchange rates. Learn how to conduct thorough risk assessments, taking into account factors such as market volatility, economic indicators, and geopolitical events that influence currency valuations.</p><p>Explore real-world examples and case studies illustrating successful risk management practices in diverse industries. From multinational corporations to small businesses expanding into international markets, this guide offers tailored insights to suit various organizational needs and risk appetites.</p>', '2024-07-02 10:34:08', '2024-07-02 10:34:08'),
(17, 2, 2, 'Steve Osborn', 'Archer', 'Comprensión de las regulaciones de pagos transfronterizos', 'understanding-cross-border-payment-regulations', '<p>Navigating the complexities of cross-border payment regulations is crucial for businesses and individuals engaged in international transactions. This in-depth guide offers a comprehensive overview of the regulatory landscape, equipping you with the knowledge to ensure compliance and streamline your global financial operations.</p><p>Cross-border payments involve multiple jurisdictions, each with its own set of laws and regulations. Understanding these regulations is essential to avoid legal pitfalls, minimize risks, and ensure the smooth flow of funds across borders. This blog post delves into key aspects of cross-border payment regulations, providing clear explanations and actionable insights.</p><p>Learn about the main regulatory bodies and frameworks governing international payments, including the Financial Action Task Force (FATF), Anti-Money Laundering (AML) regulations, and Know Your Customer (KYC) requirements. Understand the importance of complying with these regulations to prevent fraud, money laundering, and other financial crimes.</p><p>Explore the different types of cross-border payments, such as business-to-business (B2B), business-to-consumer (B2C), and peer-to-peer (P2P) transactions, and the specific regulatory requirements for each. Gain insights into the challenges and best practices for ensuring compliance, from documentation and reporting to transaction monitoring and risk assessment.</p>', '2024-07-02 10:38:02', '2024-07-02 10:38:02'),
(18, 13, 1, 'Steven Strange', 'Doctor', 'The Rise of Contactless Payments: Trends and Adoption', 'the-rise-of-contactless-payments-trends-and-adoption', '<p>Contactless payments have rapidly transformed the way we conduct transactions, offering speed, convenience, and enhanced security. This comprehensive guide explores the rise of contactless payments, highlighting key trends and adoption rates across various markets.</p><p>As the world moves towards a cashless society, contactless payment methods have gained significant traction. This blog post delves into the driving factors behind this shift, including technological advancements, changing consumer behaviors, and the impact of global events such as the COVID-19 pandemic.</p><p>Discover how contactless payment technologies, such as Near Field Communication (NFC) and Radio Frequency Identification (RFID), work to facilitate seamless transactions. Learn about the role of digital wallets, mobile payment apps, and contactless-enabled credit and debit cards in the growing ecosystem of contactless payments.</p><p>Explore the benefits of contactless payments for consumers and businesses alike. From reduced transaction times and improved customer experiences to enhanced security measures that protect against fraud, the advantages are clear. Additionally, understand the challenges and considerations, such as data privacy concerns and the need for widespread merchant adoption.</p>', '2024-07-02 12:09:08', '2024-07-02 12:09:08'),
(19, 13, 2, 'Steven Strange', 'Doctor', 'Investigación de pagos sin contacto: tendencias y adopción', 'the-rise-of-contactless-payments-trends-and-adoption', '<p>Contactless payments have rapidly transformed the way we conduct transactions, offering speed, convenience, and enhanced security. This comprehensive guide explores the rise of contactless payments, highlighting key trends and adoption rates across various markets.</p><p>As the world moves towards a cashless society, contactless payment methods have gained significant traction. This blog post delves into the driving factors behind this shift, including technological advancements, changing consumer behaviors, and the impact of global events such as the COVID-19 pandemic.</p><p>Discover how contactless payment technologies, such as Near Field Communication (NFC) and Radio Frequency Identification (RFID), work to facilitate seamless transactions. Learn about the role of digital wallets, mobile payment apps, and contactless-enabled credit and debit cards in the growing ecosystem of contactless payments.</p><p>Explore the benefits of contactless payments for consumers and businesses alike. From reduced transaction times and improved customer experiences to enhanced security measures that protect against fraud, the advantages are clear. Additionally, understand the challenges and considerations, such as data privacy concerns and the need for widespread merchant adoption.</p>', '2024-07-02 13:48:01', '2024-12-09 09:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `media` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name`, `type`, `media`, `created_at`, `updated_at`) VALUES
(1, 'about', 'single', '{\"image\":{\"path\":\"contents\\/s3hPnfKUIZrqTE7j7R9mBZ8NXCIAEH.webp\",\"driver\":\"local\"},\"button_link\":\"https:\\/\\/waiz.bugfinder.net\\/about\"}', '2023-12-02 04:55:37', '2024-07-03 04:25:20'),
(2, 'blog', 'single', NULL, '2023-12-02 05:03:23', '2023-12-02 05:03:23'),
(3, 'how_it_work', 'single', NULL, '2023-12-02 05:21:03', '2023-12-02 05:21:03'),
(4, 'how_it_work', 'multiple', '{\"image\":{\"path\":\"contents\\/5m8UtGGfGkXUmF249sqcsQZkmUIJML.webp\",\"driver\":\"local\"},\"number\":\"1\"}', '2023-12-02 05:22:10', '2024-07-02 12:36:52'),
(5, 'how_it_work', 'multiple', '{\"image\":{\"path\":\"contents\\/qwSEnMA3waNTZFxYCCJUAGqvicCHZx.webp\",\"driver\":\"local\"}}', '2023-12-02 05:29:54', '2024-07-02 12:37:02'),
(6, 'how_it_work', 'multiple', '{\"image\":{\"path\":\"contents\\/ZSUFJ2JZrHIS1KXPcKdnWZZEN0z6WP.webp\",\"driver\":\"local\"}}', '2023-12-02 05:30:24', '2024-07-02 12:37:13'),
(7, 'features', 'single', NULL, '2023-12-02 05:35:09', '2023-12-02 05:35:09'),
(8, 'features', 'multiple', '{\"image\":{\"path\":\"contents\\/VkqU3tajjNnaHMZxaBjvoUQ2409I2R.webp\",\"driver\":\"local\"}}', '2023-12-02 05:36:11', '2024-07-02 12:35:39'),
(9, 'features', 'multiple', '{\"image\":{\"path\":\"contents\\/UTOomvXAV0rQuql0NsIfQfs5BJCeH5.webp\",\"driver\":\"local\"}}', '2023-12-02 05:36:58', '2024-07-02 12:36:00'),
(10, 'features', 'multiple', '{\"image\":{\"path\":\"contents\\/wzxsPwjsZaaR2qhNGCTCgA2CyMPkUm.webp\",\"driver\":\"local\"}}', '2023-12-02 05:37:18', '2024-07-02 12:36:17'),
(11, 'features', 'multiple', '{\"image\":{\"path\":\"contents\\/gF7QOmfCOHpZxpRHaybi1ySragm92J.webp\",\"driver\":\"local\"}}', '2023-12-02 05:37:35', '2024-07-02 12:36:27'),
(12, 'why_choose_us', 'single', '{\"image\":{\"path\":\"contents\\/MBV5fERv2xpIRgEf2BNkGLYh7F0m20.webp\",\"driver\":\"local\"}}', '2023-12-02 06:29:07', '2024-07-02 11:59:16'),
(13, 'why_choose_us', 'multiple', NULL, '2023-12-02 06:40:11', '2023-12-02 06:40:11'),
(14, 'why_choose_us', 'multiple', NULL, '2023-12-02 06:40:22', '2023-12-02 06:40:22'),
(15, 'why_choose_us', 'multiple', NULL, '2023-12-02 06:40:29', '2023-12-02 06:40:29'),
(16, 'testimonial', 'single', NULL, '2023-12-02 06:53:46', '2023-12-02 06:53:46'),
(17, 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/KIcCLovQbKMVycMUjgScsbA86fM5cd.avif\",\"driver\":\"local\"}}', '2023-12-02 06:55:12', '2023-12-02 06:55:14'),
(18, 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/BqfhKgU9XhOHXbCPn9OyC7Dh623BGP.avif\",\"driver\":\"local\"}}', '2023-12-02 06:55:58', '2023-12-02 06:56:00'),
(19, 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/oSlRUMU7zzzXCf3Ipfyj5CrlKepEfI.avif\",\"driver\":\"local\"}}', '2023-12-02 06:56:53', '2023-12-02 06:56:54'),
(20, 'testimonial', 'multiple', '{\"image\":{\"path\":\"contents\\/7imphCMnrAHzWV2AqByDLoJLLrzZF7.avif\",\"driver\":\"local\"}}', '2023-12-02 06:57:37', '2023-12-02 06:57:39'),
(21, 'faq', 'single', '{\"image\":{\"path\":\"contents\\/4fBZKWPWGydBn2FdHNxGz5umCrTA13.webp\",\"driver\":\"local\"}}', '2023-12-02 07:07:54', '2024-07-02 12:02:41'),
(22, 'faq', 'multiple', NULL, '2023-12-02 07:13:16', '2023-12-02 07:13:16'),
(23, 'faq', 'multiple', NULL, '2023-12-02 07:13:42', '2023-12-02 07:13:42'),
(24, 'faq', 'multiple', NULL, '2023-12-02 07:14:19', '2023-12-02 07:14:19'),
(25, 'faq', 'multiple', NULL, '2023-12-02 07:14:43', '2023-12-02 07:14:43'),
(26, 'faq', 'multiple', NULL, '2023-12-02 07:15:00', '2023-12-02 07:15:00'),
(27, 'faq', 'multiple', NULL, '2023-12-02 07:15:26', '2023-12-02 07:15:26'),
(31, 'contact', 'single', '{\"image\":{\"path\":\"contents\\/DcxTXEZCJ6Pti4gzxVsHE9tNIB5YxD.webp\",\"driver\":\"local\"}}', '2023-12-02 10:45:23', '2024-07-02 12:04:24'),
(32, 'contact', 'multiple', NULL, '2023-12-02 10:48:51', '2023-12-02 10:48:51'),
(33, 'contact', 'multiple', NULL, '2023-12-02 10:49:27', '2023-12-02 10:49:27'),
(34, 'contact', 'multiple', NULL, '2023-12-02 10:49:53', '2023-12-02 10:49:53'),
(38, 'footer', 'single', '{\"logo\":{\"path\":\"contents\\/SH7tu2fgGx3DwkuyXlWwu3cJ3DykN6.webp\",\"driver\":\"local\"}}', '2023-12-05 04:32:00', '2024-07-02 10:43:38'),
(39, 'footer', 'multiple', '{\"icon\":\"fab fa-facebook-f\",\"link\":\"https:\\/\\/facebook.com\\/\"}', '2023-12-05 05:04:44', '2024-07-04 06:27:27'),
(40, 'footer', 'multiple', '{\"icon\":\"fab fa-twitter\",\"link\":\"https:\\/\\/x.com\\/\"}', '2023-12-05 05:05:06', '2024-07-04 06:29:20'),
(41, 'footer', 'multiple', '{\"icon\":\"fab fa-linkedin\",\"link\":\"https:\\/\\/linkedin.com\\/\"}', '2023-12-05 05:05:35', '2024-07-04 06:29:34'),
(42, 'footer', 'multiple', '{\"icon\":\"fab fa-instagram\",\"link\":\"https:\\/\\/instagram.com\\/\"}', '2023-12-05 05:05:55', '2024-07-04 06:29:50'),
(43, 'hero', 'single', '{\"image\":{\"path\":\"contents\\/kYDWCGr0gWl2gvHlMVdQT92rjptj0W.webp\",\"driver\":\"local\"},\"button_link_one\":\"https:\\/\\/waiz.bugfinder.net\\/register\",\"button_link_two\":\"https:\\/\\/www.youtube.com\\/watch?v=XIqDYTahqBs\"}', '2023-12-06 05:51:06', '2024-07-07 09:45:47'),
(44, 'news_letter', 'single', NULL, '2023-12-06 06:00:49', '2023-12-06 06:00:49'),
(45, 'login', 'single', '{\"image\":{\"path\":\"contents\\/1kFWgU3yeYscLgIn903G3O1sKL1HWe.webp\",\"driver\":\"local\"}}', '2024-02-19 06:46:21', '2024-07-02 12:03:26'),
(46, 'register', 'single', '{\"image\":{\"path\":\"contents\\/Ps3HkshmKjiwkZci4By7LYlJHJWBNP.webp\",\"driver\":\"local\"}}', '2024-02-19 07:10:14', '2024-07-02 12:03:44'),
(47, 'user_verify', 'single', '{\"image\":{\"path\":\"contents\\/2Dj4FY3kUuur5Osv2UfoG7Pnljo51W.avif\",\"driver\":\"local\"},\"image_two\":{\"path\":\"contents\\/vontASR5BoVmS5EAO2XNME5z0eMWng.webp\",\"driver\":\"local\"}}', '2024-02-28 10:38:47', '2024-07-02 12:04:02'),
(48, 'countries', 'single', NULL, '2024-03-18 06:32:05', '2024-03-18 06:32:05'),
(49, 'terms_conditions', 'single', NULL, '2024-03-19 04:40:53', '2024-03-19 04:40:53'),
(50, 'privacy_policy', 'single', NULL, '2024-03-19 05:52:23', '2024-03-19 05:52:23'),
(51, 'hero', 'multiple', NULL, '2024-07-07 09:47:30', '2024-07-07 09:47:30'),
(52, 'hero', 'multiple', NULL, '2024-07-07 09:51:22', '2024-07-07 09:51:22'),
(53, 'hero', 'multiple', NULL, '2024-07-07 09:51:32', '2024-07-07 09:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `content_details`
--

CREATE TABLE `content_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_details`
--

INSERT INTO `content_details` (`id`, `content_id`, `language_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '{\"heading\":\"About Us\",\"sub_heading\":\"Transfer &amp; Deposite Money Anytime, Anywhere In The World\",\"description\":\"At Waiz, we are dedicated to revolutionizing the way you manage your money. Our comprehensive digital platform offers seamless and secure financial solutions, from international money transfers to integrated digital wallets and virtual cards. With cutting-edge technology and a user-centric approach, we ensure that your financial transactions are fast, reliable, and cost-effective.\",\"question\":\"\",\"button_name\":\"Read More\"}', '2023-12-02 04:55:40', '2024-07-02 05:26:50'),
(2, 2, 1, '{\"heading\":\"Our Blog\",\"sub_heading\":\"Latest Blogs &amp; Articles\",\"title\":\"Stay updated with the latest news, tips, and insights on digital banking, international money transfers, and more.\"}', '2023-12-02 05:03:23', '2024-07-02 07:12:07'),
(3, 3, 1, '{\"heading\":\"How It Works\",\"sub_heading\":\"How Does Money Transfer Work?\",\"title\":\"Waiz makes managing your finances simple and intuitive. Follow these easy steps to get started\"}', '2023-12-02 05:21:03', '2024-07-02 05:34:21'),
(4, 4, 1, '{\"title\":\"Create a free account\",\"sub_title\":\"Create your Waiz account by providing basic information and completing our secure verification process.\"}', '2023-12-02 05:22:10', '2024-07-02 05:53:54'),
(5, 5, 1, '{\"title\":\"Send Money\",\"sub_title\":\"Transfer money effortlessly to friends, family, or businesses worldwide. Simply select your recipient, enter the amount, and choose the currency.\"}', '2023-12-02 05:29:54', '2024-07-02 05:56:27'),
(6, 6, 1, '{\"title\":\"Request Money\",\"sub_title\":\"Use Waiz to send a money request to anyone. They\\u2019ll receive a notification with instructions on how to complete the transfer to your account.\"}', '2023-12-02 05:30:24', '2024-07-02 05:58:49'),
(7, 7, 1, '{\"heading\":\"Features\",\"sub_heading\":\"Our Special Features\",\"title\":\"Waiz offers an array of unique features that set us apart in the world of digital banking and international money transfers\"}', '2023-12-02 05:35:09', '2024-07-02 06:17:30'),
(8, 8, 1, '{\"title\":\"Global Money Transfers\",\"sub_title\":\"Effortlessly send money to friends and family across the globe. With Waiz, international transfers are quick, secure, and cost-effective.\"}', '2023-12-02 05:36:11', '2024-07-02 05:18:42'),
(9, 9, 1, '{\"title\":\"Real-Time Exchange Rates\",\"sub_title\":\"Benefit from real-time updates on currency exchange rates, ensuring you always get the best deal on your international transactions.\"}', '2023-12-02 05:36:58', '2024-07-02 05:20:07'),
(10, 10, 1, '{\"title\":\"Bank Transfer\",\"sub_title\":\"With Waiz, sending money to bank accounts is quick and efficient, ensuring your funds reach their destination without delay.\"}', '2023-12-02 05:37:18', '2024-07-02 05:22:36'),
(11, 11, 1, '{\"title\":\"Low, Transparent Fees\",\"sub_title\":\"Enjoy competitive, upfront pricing with no hidden charges. Our low fees ensure you get the most out of every transaction.\"}', '2023-12-02 05:37:35', '2024-07-02 05:21:09'),
(12, 12, 1, '{\"heading\":\"Why Choose Us\",\"sub_heading\":\"Low, Transparent Fees\",\"description\":\"At <strong>Waiz<\\/strong>, we strive to provide an unparalleled digital banking and money transfer experience. Here\\u2019s why you should choose us\"}', '2023-12-02 06:29:15', '2024-07-02 06:03:34'),
(13, 13, 1, '{\"step\":\"Send money cheaper and easier than old-school banks\"}', '2023-12-02 06:40:11', '2023-12-02 06:40:11'),
(14, 14, 1, '{\"step\":\"Spend abroad without the hidden fees.\"}', '2023-12-02 06:40:22', '2023-12-02 06:40:22'),
(15, 15, 1, '{\"step\":\"Move money between countries for salary &amp; more.\"}', '2023-12-02 06:40:29', '2023-12-02 06:40:29'),
(16, 16, 1, '{\"heading\":\"Testimonial\",\"sub_heading\":\"What Clients Say\",\"title\":\"Help agencies to define their new business objectives and then create professional software.\"}', '2023-12-02 06:53:46', '2024-07-02 06:13:11'),
(17, 17, 1, '{\"name\":\"John D.\",\"location\":\"New York, USA\",\"narration\":\"Waiz has completely transformed the way I handle international transfers. The process is fast, reliable, and incredibly user-friendly. I highly recommend Waiz to anyone needing a trustworthy money transfer solution.\"}', '2023-12-02 06:55:14', '2024-07-02 06:06:30'),
(18, 18, 1, '{\"name\":\"Maria S.\",\"location\":\"Madrid, Spain\",\"narration\":\"I love the low fees and real-time exchange rates that Waiz offers. It\\u2019s so easy to send money to my family overseas. The app\\u2019s interface is intuitive, and the customer support is fantastic!\"}', '2023-12-02 06:56:00', '2024-07-02 06:07:56'),
(19, 19, 1, '{\"name\":\"Justine Pratt\",\"location\":\"Sydney, Australia.\",\"narration\":\"Using Waiz for my business has been a game-changer. Transactions are smooth, and the notification system keeps me informed every step of the way. It also has the virtual card support.\"}', '2023-12-02 06:56:54', '2024-07-03 04:51:04'),
(20, 20, 1, '{\"name\":\"Sophia R.\",\"location\":\"London, UK\",\"narration\":\"The best part about Waiz is its transparency. There are no hidden fees, and the real-time exchange rates are always competitive. I feel secure using Waiz for all my financial transactions.\"}', '2023-12-02 06:57:39', '2024-07-02 06:10:54'),
(21, 21, 1, '{\"heading\":\"F.A.Q\",\"sub_heading\":\"Still, Have Questions?\",\"title\":\"Waiz is a comprehensive digital platform offering international money transfers, digital wallet integration, and virtual card support.\"}', '2023-12-02 07:07:54', '2024-07-02 06:41:24'),
(22, 22, 1, '{\"question\":\"How does the money transfer service work?\",\"answer\":\"Our money transfer service allows you to send and receive funds securely\\r\\nand conveniently. You can initiate a transfer by selecting the\\r\\nrecipient, specifying the amount, and choosing the payment method. Once\\r\\nthe transfer is confirmed, the funds will be sent to the recipient\'s\\r\\naccount.\"}', '2023-12-02 07:13:16', '2024-07-02 07:08:27'),
(23, 23, 1, '{\"question\":\"How long does it take for a money transfer to be processed?\",\"answer\":\"The processing time for money transfers can vary based on the payment method and the recipient\'s location. In most cases, transfers are completed within a few business days.\"}', '2023-12-02 07:13:42', '2024-07-02 07:09:46'),
(24, 24, 1, '{\"question\":\"Can I track the status of my money transfer?\",\"answer\":\"Yes, you can track the status of your money transfer through your account dashboard. We also provide email notifications for important updates during the transfer process.\"}', '2023-12-02 07:14:19', '2024-07-02 07:10:33'),
(25, 25, 1, '{\"question\":\"Is my personal and financial information safe on your website?\",\"answer\":\"<span style=\\\"color:rgb(71,77,87);font-family:Jost, sans-serif;font-size:16px;background-color:rgba(0,153,105,0.1);\\\">Yes, we take the security of your personal and financial information seriously. Our website employs robust encryption protocols and follows industry best practices to safeguard your data from unauthorized access or misuse.<\\/span>\",\"description\":\"\"}', '2023-12-02 07:14:43', '2023-12-02 07:14:43'),
(26, 26, 1, '{\"question\":\"What payment methods do you support for money transfers?\",\"answer\":\"<span style=\\\"color:rgb(71,77,87);font-family:Jost, sans-serif;font-size:16px;background-color:rgba(0,153,105,0.1);\\\">We support various payment methods, including credit\\/debit cards and bank transfers. The available options will be displayed during the transfer process.<\\/span>\",\"description\":\"\"}', '2023-12-02 07:15:00', '2023-12-02 07:15:00'),
(27, 27, 1, '{\"question\":\"Are there any fees associated with sending or receiving money?\",\"answer\":\"<span style=\\\"color:rgb(71,77,87);font-family:Jost, sans-serif;font-size:16px;background-color:rgba(0,153,105,0.1);\\\">Yes, there might be fees associated with money transfers. The applicable fees will be displayed before you confirm the transaction.<\\/span>\",\"description\":\"\"}', '2023-12-02 07:15:26', '2023-12-02 07:15:26'),
(31, 31, 1, '{\"heading\":\"Get in Touch\",\"sub_heading\":\"Have questions or need assistance? We\\u2019re here to help!\",\"title\":\"Contact Information\",\"sub_title\":\"Whether you have questions about our services, need technical support, or want to share your thoughts with us, we\\u2019re here to ensure you have a smooth and enjoyable experience with Waiz.\"}', '2023-12-02 10:45:31', '2024-07-02 07:14:46'),
(32, 32, 1, '{\"name\":\"Phone\",\"value_one\":\"+5462783552\",\"value_two\":\"+1545644554\"}', '2023-12-02 10:48:51', '2024-07-02 07:17:27'),
(33, 33, 1, '{\"name\":\"Email\",\"value_one\":\"support@example.com\",\"value_two\":\"\"}', '2023-12-02 10:49:27', '2024-07-02 07:19:32'),
(34, 34, 1, '{\"name\":\"Address\",\"value_one\":\"49 Spruce RoadJamestown, NY 14701\",\"value_two\":\"40 Spruce RoadJamestown, NY 14701\"}', '2023-12-02 10:49:53', '2024-07-02 07:20:24'),
(38, 38, 1, '{\"location\":\"49 Spruce RoadJamestown, NY 14701\",\"email\":\"support@example.com\",\"phone\":\"+185484655\",\"details\":\"Waiz is dedicated to providing seamless digital banking solutions, including international money transfers, digital wallets, and virtual cards. Our goal is to simplify financial transactions with advanced technology and excellent customer support.\"}', '2023-12-05 04:50:07', '2024-07-02 07:23:26'),
(39, 39, 1, NULL, '2023-12-05 05:04:44', '2024-07-04 06:28:09'),
(40, 40, 1, NULL, '2023-12-05 05:05:06', '2024-07-04 06:29:20'),
(41, 41, 1, NULL, '2023-12-05 05:05:36', '2024-07-04 06:29:34'),
(42, 42, 1, NULL, '2023-12-05 05:05:55', '2024-07-04 06:29:50'),
(43, 43, 1, '{\"main_heading\":\"Money Transfer\",\"heading\":\"Easiest &amp; Simple Global Money Transfer.\",\"sub_heading\":\"Efficient, adaptable, and safe international money transfer worldwide. Save both time and funds when you make international transfers through us\",\"title\":\"Send Your Mony Here!\",\"sub_title\":\"Fast and reliable international money transfer app.\",\"button_one\":\"Open An Account\",\"button_two\":\"Watch Video\"}', '2023-12-06 05:51:06', '2024-07-07 09:45:47'),
(44, 44, 1, '{\"heading\":\"SUBSCRIBE TO OUR\",\"sub_heading\":\"NEWSLETTER\",\"button_name\":\"Subscribe\"}', '2023-12-06 06:00:49', '2023-12-06 06:00:49'),
(45, 45, 1, '{\"title_one\":\"Welcome back!\",\"title_two\":\"Hey Enter your details to get sign in to your account\",\"button_name\":\"Log In\"}', '2024-02-19 06:46:26', '2024-02-19 06:46:26'),
(46, 46, 1, '{\"title_one\":\"Welcome!\",\"title_two\":\"Hey Enter your details to register your account\",\"button_name\":\"Sign Up\"}', '2024-02-19 07:10:19', '2024-02-19 07:10:19'),
(47, 1, 2, '{\"heading\":\"Sobre nosotros\",\"sub_heading\":\"Transfiera y deposite dinero en cualquier momento y en cualquier parte del mundo\",\"description\":\"En Waiz, nos dedicamos a revolucionar la forma en que administra su dinero. Nuestra plataforma digital integral ofrece soluciones financieras seguras y fluidas, desde transferencias de dinero internacionales hasta billeteras digitales integradas y tarjetas virtuales. Con tecnolog\\u00eda de punta y un enfoque centrado en el usuario, garantizamos que sus transacciones financieras sean r\\u00e1pidas, confiables y rentables.\",\"question\":\"\",\"button_name\":\"Leer m\\u00e1s\"}', '2024-02-27 11:52:40', '2024-07-02 06:15:42'),
(48, 7, 2, '{\"heading\":\"Caracter\\u00edsticas\",\"sub_heading\":\"Nuestras caracter\\u00edsticas especiales\",\"title\":\"Waiz ofrece una variedad de caracter\\u00edsticas \\u00fanicas que nos distinguen en el mundo de la banca digital y las transferencias internacionales de dinero.\"}', '2024-02-27 12:01:58', '2024-07-02 06:18:08'),
(49, 2, 2, '{\"heading\":\"Nuestro blog\",\"sub_heading\":\"\\u00daltimos blogs y art\\u00edculos\",\"title\":\"Mant\\u00e9ngase actualizado con las \\u00faltimas noticias, consejos e informaci\\u00f3n sobre banca digital, transferencias internacionales de dinero y m\\u00e1s.\"}', '2024-02-27 12:09:08', '2024-07-02 07:13:04'),
(50, 38, 2, '{\"location\":\"49 Spruce RoadJamestown, NY 14701\",\"email\":\"support@example.com\",\"phone\":\"+16529900\",\"details\":\"Waiz se dedica a brindar soluciones bancarias digitales integradas, incluidas transferencias internacionales de dinero, billeteras digitales y tarjetas virtuales. Nuestro objetivo es simplificar las transacciones financieras con tecnolog\\u00eda avanzada y excelente atenci\\u00f3n al cliente.\"}', '2024-02-27 12:12:19', '2024-07-02 07:24:20'),
(51, 21, 2, '{\"heading\":\"F.A.Q\",\"sub_heading\":\"A\\u00fan as\\u00ed, \\u00bftiene preguntas?\",\"title\":\"Waiz es una plataforma digital integral que ofrece transferencias de dinero internacionales, integraci\\u00f3n de billetera digital y soporte para tarjetas virtuales.\"}', '2024-02-27 12:33:09', '2024-07-02 06:41:12'),
(52, 31, 2, '{\"heading\":\"Ponerse en contacto\",\"sub_heading\":\"Tiene preguntas o necesita ayuda? \\u00a1Estamos aqu\\u00ed para ayudar!\",\"title\":\"Informaci\\u00f3n del contacto\",\"sub_title\":\"Ya sea que tenga preguntas sobre nuestros servicios, necesite asistencia t\\u00e9cnica o desee compartir sus opiniones con nosotros, estamos aqu\\u00ed para garantizar que tenga una experiencia fluida y agradable con Waiz.\"}', '2024-02-27 12:34:47', '2024-07-02 07:15:35'),
(53, 47, 1, '{\"title_one\":\"\"}', '2024-02-28 10:43:22', '2024-02-28 10:46:13'),
(54, 48, 1, '{\"heading\":\"Country Supported\",\"sub_heading\":\"Popular Countries To Send Money\"}', '2024-03-18 06:32:05', '2024-03-18 06:32:05'),
(55, 48, 2, '{\"heading\":\"Pa\\u00eds admitido\",\"sub_heading\":\"Pa\\u00edses populares para enviar dinero\"}', '2024-03-18 06:36:56', '2024-07-02 07:21:50'),
(56, 49, 1, '{\"heading\":\"WAIZ DEMO - TERMS AND CONDITIONS\",\"description\":\"<div class=\\\"container\\\" style=\\\"color:rgb(33,37,41);font-family:Prompt, sans-serif;font-size:16px;\\\"><div class=\\\"container\\\" style=\\\"color:rgb(103,119,136);font-family:Inter, sans-serif;font-weight:400;\\\"><p><br><\\/p><p>Waiz may collect and process certain information during your use of the Demo. By accessing the Demo, you consent to the collection, use, and storage of such data in accordance with our Privacy Policy.<\\/p><div>All intellectual property rights related to the Demo, including but not limited to software, design, and content, are owned by Waiz and its licensors.<\\/div><div><br><\\/div><\\/div><h6>USAGE RESTRICTIONS:<\\/h6><h5><\\/h5><div class=\\\"container\\\" style=\\\"color:rgb(103,119,136);font-family:Inter, sans-serif;font-weight:400;\\\"><p><span>Waiz<\\/span>\\u00a0may collect and process certain information during your use of the Demo. By accessing the Demo, you consent to the collection, use, and storage of such data in accordance with our Privacy Policy.<\\/p><div><br><\\/div><\\/div><h6>INTELLECTUAL PROPERTY:<\\/h6><h5><\\/h5><div class=\\\"container\\\" style=\\\"color:rgb(103,119,136);font-family:Inter, sans-serif;font-weight:400;\\\"><ul><li>1. All intellectual property rights related to the Demo, including but not limited to software, design, and content, are owned by Waiz\\u00a0and its licensors.<\\/li><li>2. Users may not reproduce, distribute, or create derivative works from any part of the Demo without explicit permission .<\\/li><\\/ul><br><\\/div><h6>DATA PRIVACY:<\\/h6><h5><\\/h5><div class=\\\"container\\\" style=\\\"color:rgb(103,119,136);font-family:Inter, sans-serif;font-weight:400;\\\"><ul><li>Waiz\\u00a0may collect and process certain information during your use of the Demo. By accessing the Demo, you consent to the collection, use, and storage of such data in accordance with our Privacy Policy.<\\/li><\\/ul><br><\\/div><h6>NO WARRANTY:<\\/h6><h5><\\/h5><div class=\\\"container\\\" style=\\\"color:rgb(103,119,136);font-family:Inter, sans-serif;font-weight:400;\\\"><ul><li>The Demo is provided \\\"as-is\\\" without any warranty or guarantee of any kind. Waiz\\u00a0disclaims all warranties, express or implied, including but not limited to the implied warranties of merchantability and fitness for a particular purpose.<\\/li><\\/ul><br><\\/div><h6>LIMITATION OF LIABILITY:<\\/h6><h5><\\/h5><div class=\\\"container\\\" style=\\\"color:rgb(103,119,136);font-family:Inter, sans-serif;font-weight:400;\\\"><ul><li>Waiz\\u00a0shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use or performance of the Demo.<br><\\/li><\\/ul><\\/div><\\/div>\"}', '2024-03-19 04:40:53', '2024-03-19 06:07:26'),
(57, 50, 1, '{\"heading\":\"WAIZ DEMO - PRIVACY POLICY\",\"description\":\"<div><div class=\\\"container\\\" style=\\\"font-size:16px;\\\"><div class=\\\"container\\\"><p>Waiz may collect and process certain information during your use of the Demo. By accessing the Demo, you consent to the collection, use, and storage of such data in accordance with our Privacy Policy.<\\/p><div>All intellectual property rights related to the Demo, including but not limited to software, design, and content, are owned by Waiz and its licensors.<\\/div><div><br><\\/div><\\/div><h6>USAGE RESTRICTIONS:<\\/h6><h5><\\/h5><div class=\\\"container\\\"><p>Waiz\\u00a0may collect and process certain information during your use of the Demo. By accessing the Demo, you consent to the collection, use, and storage of such data in accordance with our Privacy Policy.<\\/p><div><br><\\/div><\\/div><h6>INTELLECTUAL PROPERTY:<\\/h6><h5><\\/h5><div class=\\\"container\\\"><ul><li>1. All intellectual property rights related to the Demo, including but not limited to software, design, and content, are owned by Waiz\\u00a0and its licensors.<\\/li><li>2. Users may not reproduce, distribute, or create derivative works from any part of the Demo without explicit permission .<\\/li><\\/ul><br><\\/div><h6>DATA PRIVACY:<\\/h6><h5><\\/h5><div class=\\\"container\\\"><ul><li>Waiz\\u00a0may collect and process certain information during your use of the Demo. By accessing the Demo, you consent to the collection, use, and storage of such data in accordance with our Privacy Policy.<\\/li><\\/ul><br><\\/div><h6>NO WARRANTY:<\\/h6><h5><\\/h5><div class=\\\"container\\\"><ul><li>The Demo is provided \\\"as-is\\\" without any warranty or guarantee of any kind. Waiz\\u00a0disclaims all warranties, express or implied, including but not limited to the implied warranties of merchantability and fitness for a particular purpose.<\\/li><\\/ul><br><\\/div><h6>LIMITATION OF LIABILITY:<\\/h6><h5><\\/h5><div class=\\\"container\\\"><ul><li>Waiz\\u00a0shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with the use or performance of the Demo.<\\/li><\\/ul><\\/div><\\/div><\\/div>\"}', '2024-03-19 05:52:23', '2024-03-19 06:14:48'),
(61, 4, 2, '{\"title\":\"Crea una cuenta nueva\",\"sub_title\":\"Cree su cuenta Waiz proporcionando informaci\\u00f3n b\\u00e1sica y completando nuestro proceso de verificaci\\u00f3n segura.\"}', '2024-07-02 05:45:35', '2024-07-02 06:26:40'),
(62, 5, 2, '{\"title\":\"Enviar dinero\",\"sub_title\":\"Transfiera dinero sin esfuerzo a amigos, familiares o empresas en todo el mundo. Simplemente seleccione su destinatario, ingrese el monto y elija la moneda.\"}', '2024-07-02 05:57:01', '2024-07-02 05:57:01'),
(63, 6, 2, '{\"title\":\"Pedir dinero\",\"sub_title\":\"Utilice Waiz para enviar una solicitud de dinero a cualquier persona. Recibir\\u00e1n una notificaci\\u00f3n con instrucciones sobre c\\u00f3mo completar la transferencia a su cuenta.\"}', '2024-07-02 05:58:30', '2024-07-02 05:59:03'),
(64, 17, 2, '{\"name\":\"John D.\",\"location\":\"New York, USA\",\"narration\":\"Waiz ha transformado por completo la forma en que manejo las transferencias internacionales. El proceso es r\\u00e1pido, confiable e incre\\u00edblemente f\\u00e1cil de usar. Recomiendo encarecidamente Waiz a cualquiera.\"}', '2024-07-02 06:07:08', '2024-07-03 09:11:56'),
(65, 18, 2, '{\"name\":\"Maria S.\",\"location\":\"Madrid, Spain\",\"narration\":\"Me encantan las tarifas bajas y los tipos de cambio en tiempo real que ofrece Waiz. Es muy f\\u00e1cil enviar dinero a mi familia en el extranjero. \\u00a1La interfaz de la aplicaci\\u00f3n es intuitiva y la atenci\\u00f3n al cliente es fant\\u00e1stica!\"}', '2024-07-02 06:08:27', '2024-07-02 06:08:27'),
(66, 19, 2, '{\"name\":\"Justine Pratt\",\"location\":\"Sydney, Australia.\",\"narration\":\"<p>                                                                 Usar Waiz para mi negocio ha cambiado las reglas del juego. El soporte de la tarjeta virtual y el completo proceso KYC me dan tranquilidad. Las transacciones son fluidas y el sistema de notificaciones me<span>.<\\/span><\\/p>\"}', '2024-07-02 06:09:49', '2024-07-03 09:11:18'),
(67, 20, 2, '{\"name\":\"Sophia R.\",\"location\":\"London, UK\",\"narration\":\"La mejor parte de Waiz es su transparencia. No hay tarifas ocultas y los tipos de cambio en tiempo real son siempre competitivos. Me siento seguro al usar Waiz para todas mis transacciones financieras.\"}', '2024-07-02 06:11:33', '2024-07-02 06:11:33'),
(68, 16, 2, '{\"heading\":\"Testimonial\",\"sub_heading\":\"Lo que dicen las clientes\",\"title\":\"Ayude a las agencias a definir sus nuevos objetivos comerciales y luego crear software profesional.\"}', '2024-07-02 06:14:07', '2024-07-02 07:42:28'),
(69, 43, 2, '{\"main_heading\":\"Transferencia de dinero\",\"heading\":\"Transferencia de dinero global m\\u00e1s f\\u00e1cil y sencilla.\",\"sub_heading\":\"Transferencia de dinero internacional eficiente, adaptable y segura en todo el mundo. Ahorre tiempo y fondos cuando realice transferencias internacionales a trav\\u00e9s de nosotros\",\"title\":\"\\u00a1Env\\u00eda tu dinero aqu\\u00ed!\",\"sub_title\":\"Aplicaci\\u00f3n de transferencia de dinero internacional r\\u00e1pida y confiable.\",\"button_one\":\"Abrir una cuenta\",\"button_two\":\"Ver video\"}', '2024-07-02 06:15:28', '2024-07-07 09:46:36'),
(70, 3, 2, '{\"heading\":\"C\\u00f3mo funciona\",\"sub_heading\":\"\\u00bfC\\u00f3mo funciona la transferencia de dinero?\",\"title\":\"Waiz hace que administrar sus finanzas sea simple e intuitivo. Siga estos sencillos pasos para comenzar\"}', '2024-07-02 06:20:42', '2024-07-02 06:20:42'),
(71, 8, 2, '{\"title\":\"Transferencias de dinero globales\",\"sub_title\":\"Env\\u00ede dinero sin esfuerzo a amigos y familiares en todo el mundo. Con Waiz, las transferencias internacionales son r\\u00e1pidas, seguras y rentables.\"}', '2024-07-02 06:22:00', '2024-07-02 06:22:00'),
(72, 9, 2, '{\"title\":\"Tipos de cambio en tiempo real\",\"sub_title\":\"Benef\\u00edciese de actualizaciones en tiempo real sobre los tipos de cambio de divisas, lo que le permitir\\u00e1 obtener siempre la mejor oferta en sus transacciones internacionales.\"}', '2024-07-02 06:23:00', '2024-07-02 06:23:00'),
(73, 10, 2, '{\"title\":\"Transferencia bancaria\",\"sub_title\":\"Con Waiz, enviar dinero a cuentas bancarias es r\\u00e1pido y eficiente, lo que garantiza que sus fondos lleguen a su destino sin demora.\"}', '2024-07-02 06:24:44', '2024-07-02 06:24:44'),
(74, 11, 2, '{\"title\":\"Tarifas bajas y transparentes\",\"sub_title\":\"Disfrute de precios competitivos y por adelantado sin cargos ocultos. Nuestras tarifas bajas garantizan que aproveche al m\\u00e1ximo cada transacci\\u00f3n.\"}', '2024-07-02 06:25:10', '2024-07-02 06:25:10'),
(75, 12, 2, '{\"heading\":\"Por qu\\u00e9 elegirnos\",\"sub_heading\":\"Tarifas bajas y transparentes\",\"description\":\"En Waiz, nos esforzamos por brindar una experiencia de transferencia de dinero y banca digital incomparable. He aqu\\u00ed por qu\\u00e9 deber\\u00eda elegirnos\"}', '2024-07-02 06:27:41', '2024-07-02 06:27:41'),
(76, 13, 2, '{\"step\":\"Env\\u00eda dinero m\\u00e1s barato y m\\u00e1s f\\u00e1cilmente que los bancos de la vieja escuela\"}', '2024-07-02 06:28:07', '2024-07-02 06:28:07'),
(77, 14, 2, '{\"step\":\"Gaste en el extranjero sin tarifas ocultas.\"}', '2024-07-02 06:28:26', '2024-07-02 06:28:26'),
(78, 15, 2, '{\"step\":\"Mueva dinero entre pa\\u00edses para obtener salario y m\\u00e1s.\"}', '2024-07-02 06:31:46', '2024-07-02 06:31:46'),
(79, 44, 2, '{\"heading\":\"SUSCR\\u00cdBETE A NUESTRO\",\"sub_heading\":\"BOLETIN INFORMATIVO\",\"button_name\":\"Suscribir\"}', '2024-07-02 06:38:54', '2024-07-02 06:38:54'),
(80, 22, 2, '{\"question\":\"\\u00bfC\\u00f3mo funciona el servicio de transferencia de dinero?\",\"answer\":\"Nuestro servicio de transferencia de dinero le permite enviar y recibir fondos de forma segura\\r\\ny convenientemente. Puede iniciar una transferencia seleccionando el\\r\\ndestinatario, especificando el importe y eligiendo el m\\u00e9todo de pago. Una vez\\r\\nSe confirma la transferencia, los fondos se enviar\\u00e1n a la cuenta del destinatario.\\r\\ncuenta.\"}', '2024-07-02 07:09:10', '2024-07-02 07:09:10'),
(81, 23, 2, '{\"question\":\"\\u00bfCu\\u00e1nto tiempo se tarda en procesar una transferencia de dinero?\",\"answer\":\"El tiempo de procesamiento de las transferencias de dinero puede variar seg\\u00fan el m\\u00e9todo de pago y la ubicaci\\u00f3n del destinatario. En la mayor\\u00eda de los casos, las transferencias se completan en unos pocos d\\u00edas h\\u00e1biles.\"}', '2024-07-02 07:10:12', '2024-07-02 07:10:12'),
(82, 24, 2, '{\"question\":\"\\u00bfPuedo rastrear el estado de mi transferencia de dinero?\",\"answer\":\"S\\u00ed, puede realizar un seguimiento del estado de su transferencia de dinero a trav\\u00e9s del panel de su cuenta. Tambi\\u00e9n proporcionamos notificaciones por correo electr\\u00f3nico sobre actualizaciones importantes durante el proceso de transferencia.\"}', '2024-07-02 07:11:02', '2024-07-02 07:11:02'),
(83, 32, 2, '{\"name\":\"Tel\\u00e9fono\",\"value_one\":\"01871344252\",\"value_two\":\"+154545444556\"}', '2024-07-02 07:16:32', '2024-07-02 07:16:32'),
(84, 33, 2, '{\"name\":\"Correo electr\\u00f3nico\",\"value_one\":\"support@example.com\",\"value_two\":\"\"}', '2024-07-02 07:19:24', '2024-07-02 07:19:24'),
(85, 34, 2, '{\"name\":\"DIRECCI\\u00d3N\",\"value_one\":\"49 Spruce RoadJamestown, NY 14701\",\"value_two\":\"39 Spruce RoadJamestown, NY 14701\"}', '2024-07-02 07:21:19', '2024-07-02 07:21:19'),
(86, 45, 2, '{\"title_one\":\"\\u00a1Bienvenido de nuevo!\",\"title_two\":\"Hola, ingresa tus datos para iniciar sesi\\u00f3n en tu cuenta.\",\"button_name\":\"Acceso\"}', '2024-07-02 07:25:12', '2024-07-02 07:25:12'),
(87, 46, 2, '{\"title_one\":\"\\u00a1Bienvenida!\",\"title_two\":\"Hola, ingresa tus datos para registrar tu cuenta.\",\"button_name\":\"Inscribirse\"}', '2024-07-02 07:26:38', '2024-07-02 07:26:38'),
(88, 39, 2, NULL, '2024-07-04 06:30:45', '2024-07-04 06:30:45'),
(89, 40, 2, NULL, '2024-07-04 06:31:13', '2024-07-04 06:31:13'),
(90, 41, 2, NULL, '2024-07-04 06:31:43', '2024-07-04 06:31:43'),
(91, 42, 2, NULL, '2024-07-04 06:31:59', '2024-07-04 06:31:59'),
(92, 51, 1, '{\"feature\":\"100% Safe Secure\"}', '2024-07-07 09:47:30', '2024-07-07 09:47:30'),
(93, 52, 1, '{\"feature\":\"Speedly Money Exchange\"}', '2024-07-07 09:51:22', '2024-07-07 09:51:22'),
(94, 53, 1, '{\"feature\":\"Payment Platform\"}', '2024-07-07 09:51:32', '2024-07-07 09:51:32'),
(95, 51, 2, '{\"feature\":\"100% Seguro Seguro\"}', '2024-07-07 09:51:50', '2024-07-07 09:51:50'),
(96, 52, 2, '{\"feature\":\"Cambio de dinero r\\u00e1pido\"}', '2024-07-07 09:52:24', '2024-07-07 09:52:24'),
(97, 53, 2, '{\"feature\":\"Plataforma de pago\"}', '2024-07-07 09:52:48', '2024-07-07 09:52:48');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT 'local',
  `phone_code` varchar(5) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `subregion` varchar(255) DEFAULT NULL,
  `send_to` tinyint(1) NOT NULL DEFAULT 0,
  `receive_from` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_banks`
--

CREATE TABLE `country_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `bank_code` varchar(255) DEFAULT NULL,
  `operatorId` int(11) DEFAULT NULL,
  `localMinAmount` int(11) DEFAULT NULL,
  `localMaxAmount` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `services_form` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_cities`
--

CREATE TABLE `country_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_code` varchar(3) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_currency`
--

CREATE TABLE `country_currency` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rate` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=>Yes, 0=>No',
  `precision` tinyint(4) NOT NULL DEFAULT 2,
  `symbol` varchar(255) DEFAULT NULL,
  `symbol_native` varchar(255) DEFAULT NULL,
  `symbol_first` tinyint(4) NOT NULL DEFAULT 1,
  `decimal_mark` varchar(1) NOT NULL DEFAULT '.',
  `thousands_separator` varchar(1) NOT NULL DEFAULT ',',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_services`
--

CREATE TABLE `country_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_services`
--

INSERT INTO `country_services` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Local Bank Transfer', 1, '2024-01-15 09:46:13', '2024-01-15 09:59:42'),
(2, 'Mobile Transfer', 1, '2024-01-15 10:02:04', '2024-01-21 06:17:18'),
(3, 'Mobile Top Up', 1, '2024-01-15 10:02:24', '2024-01-22 10:52:33'),
(4, 'Cash Pick-Up', 0, '2024-01-15 10:02:36', '2024-03-18 09:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_code` varchar(3) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `depositable_id` int(11) DEFAULT NULL,
  `depositable_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method_currency` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `wallet_id` varchar(255) DEFAULT NULL,
  `percentage_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT 0.00000000,
  `payable_amount` decimal(18,8) NOT NULL DEFAULT 0.00000000 COMMENT 'Amount payed',
  `base_currency_charge` double(18,8) DEFAULT 0.00000000,
  `payable_amount_in_base_currency` double(18,8) NOT NULL DEFAULT 0.00000000,
  `btc_amount` decimal(18,8) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `trx_id` char(36) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=success, 2=request, 3=rejected',
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storages`
--

CREATE TABLE `file_storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => active, 0 => inactive',
  `parameters` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storages`
--

INSERT INTO `file_storages` (`id`, `code`, `name`, `logo`, `driver`, `status`, `parameters`, `created_at`, `updated_at`) VALUES
(1, 's3', 'Amazon S3', 'driver/GJrBdvIxtnEprk0kHylgzNh6LcGcfOUcA205IIK5.png', 'local', 0, '{\"access_key_id\":\"xys6\",\"secret_access_key\":\"xys\",\"default_region\":\"xys5\",\"bucket\":\"xys6\",\"url\":\"xysds\"}', NULL, '2023-10-14 21:24:29'),
(2, 'sftp', 'SFTP', 'driver/q8E08YsobyRZGOLHHeKGhwysWsi25F186EbaNNRx.png', 'local', 0, '{\"sftp_username\":\"xys6\",\"sftp_password\":\"xys\"}', NULL, '2023-06-10 17:28:03'),
(3, 'do', 'Digitalocean Spaces', 'driver/iA8q685PBCnOAkmctLXZWhyqSoh7cJMOewpW4S8r.png', 'local', 0, '{\"spaces_key\":\"hj\",\"spaces_secret\":\"vh\",\"spaces_endpoint\":\"jk\",\"spaces_region\":\"sfo2\",\"spaces_bucket\":\"assets-coral\"}', NULL, '2023-06-10 17:45:21'),
(4, 'ftp', 'FTP', 'driver/wIwEOAJ45KgVGw0PL80WNfcbosB4IuUlxStfeHCX.png', 'local', 0, '{\"ftp_host\":\"xys6\",\"ftp_username\":\"xys\",\"ftp_password\":\"xys6\"}', NULL, '2023-06-10 17:27:43'),
(5, 'local', 'Local Storage', '', NULL, 1, NULL, NULL, '2023-06-19 03:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `fire_base_tokens`
--

CREATE TABLE `fire_base_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_id` int(11) DEFAULT NULL,
  `tokenable_type` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_by` int(11) DEFAULT 1,
  `image` varchar(191) DEFAULT NULL,
  `driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: inactive, 1: active',
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `supported_currency` varchar(255) DEFAULT NULL,
  `receivable_currencies` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `currency_type` tinyint(1) NOT NULL DEFAULT 1,
  `is_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `environment` enum('test','live') NOT NULL DEFAULT 'live',
  `is_manual` tinyint(1) DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `name`, `sort_by`, `image`, `driver`, `status`, `parameters`, `currencies`, `extra_parameters`, `supported_currency`, `receivable_currencies`, `description`, `currency_type`, `is_sandbox`, `environment`, `is_manual`, `note`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'Paypal', 3, 'gateway/rukxDLSXMeMGGyN6KiTucF5Bh30FbO.webp', 'local', 0, '{\"cleint_id\":\"\",\"secret\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}}', NULL, '[\"INR\",\"USD\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0036\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.30\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(2, 'stripe', 'Stripe ', 1, 'gateway/F2Dca5VrhZOm5QSTvSj6Cb9D6R2UUp.webp', 'local', 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}}', NULL, '[\"USD\",\"GBP\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"GBP\",\"currency_symbol\":\"GBP\",\"conversion_rate\":0.75,\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(3, 'skrill', 'Skrill', 35, 'gateway/Fkb2V3GNXGIYSSoGXFjH6fmKh6YpsJ.webp', 'local', 0, '{\"pay_to_email\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}}', NULL, '[\"AUD\",\"USD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"2\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"1.5\",\"fixed_charge\":\"0.8\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(4, 'perfectmoney', 'Perfect Money', 7, 'gateway/eSSreBDztXYn9UjK91B0muLr1Nf2kN.webp', 'local', 0, '{\"passphrase\":\"\",\"payee_account\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.9\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(5, 'paytm', 'PayTM', 20, 'gateway/gWebvaDTOPQPOiu2Le5EKKSGeTA2ZL.webp', 'local', 0, '{\"MID\":\"\",\"merchant_key\":\"\",\"WEBSITE\":\"\",\"INDUSTRY_TYPE_ID\":\"\",\"CHANNEL_ID\":\"\",\"environment_url\":\"\",\"process_transaction_url\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(6, 'payeer', 'Payeer', 12, 'gateway/ypnPuzm1Kxm24UJoKfEAy2dFlhSgx2.webp', 'local', 0, '{\"merchant_id\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}}', '{\"status\":\"ipn\"}', '[\"USD\",\"RUB\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"RUB\",\"currency_symbol\":\"RUD\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(7, 'paystack', 'PayStack', 6, 'gateway/DR1hOWzTPm7wdvmJVGenNVFqdT5SJP.webp', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"NGN\":\"NGN\"}}', '{\"callback\":\"ipn\",\"webhook\":\"ipn\"}\r\n', '[\"USD\",\"NGN\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(8, 'voguepay', 'VoguePay', 26, 'gateway/x6HOsziQhmuJ7iu46zMKdBEewDSesm.avif', 'local', 0, '{\"merchant_id\":\"\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"ZAR\":\"ZAR\",\"JPY\":\"JPY\",\"INR\":\"INR\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PLN\":\"PLN\"}}\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', NULL, '[\"NGN\",\"EUR\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(9, 'flutterwave', 'Flutterwave', 2, 'gateway/AYYHy5rYbjo8OGBV2PX7aqpP5IHyOg.webp', 'local', 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\"}', '{\"0\":{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}}', NULL, '[\"GHS\",\"NGN\",\"USD\"]', '[{\"name\":\"GHS\",\"currency_symbol\":\"GHS\",\"conversion_rate\":\"1.5\",\"min_limit\":\"1\",\"max_limit\":\"12000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"1527.50\",\"min_limit\":\"1\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(10, 'razorpay', 'RazorPay', 34, 'gateway/HvTfH2WAQtw0pcN4ZzssUT5l86FMCZ.avif', 'local', 0, '{\"key_id\":\"\",\"key_secret\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\",\"USD\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"75\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"40\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(11, 'instamojo', 'instamojo', 10, 'gateway/y9M8j59LNJSYiedc6WeaSMJy8YqmNv.webp', 'local', 0, '{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(12, 'mollie', 'Mollie', 21, 'gateway/fOrbgqnljcnSUXXXNBEN68fVu7veJd.webp', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}}', NULL, '[\"AUD\",\"BRL\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"BRL\",\"currency_symbol\":\"BRL\",\"conversion_rate\":\"0.045\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(13, 'twocheckout', '2checkout', 9, 'gateway/0zezRmPTfrn1Q34gnv65bUCoMVtT6s.webp', 'local', 0, '{\"merchant_code\":\"\",\"secret_key\":\"\"}', '{\"0\":{\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"DZD\":\"DZD\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BSD\":\"BSD\",\"BDT\":\"BDT\",\"BBD\":\"BBD\",\"BZD\":\"BZD\",\"BMD\":\"BMD\",\"BOB\":\"BOB\",\"BWP\":\"BWP\",\"BRL\":\"BRL\",\"GBP\":\"GBP\",\"BND\":\"BND\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"XCD\":\"XCD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JMD\":\"JMD\",\"JPY\":\"JPY\",\"KZT\":\"KZT\",\"KES\":\"KES\",\"LAK\":\"LAK\",\"MMK\":\"MMK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MOP\":\"MOP\",\"MYR\":\"MYR\",\"MVR\":\"MVR\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PGK\":\"PGK\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"WST\":\"WST\",\"SAR\":\"SAR\",\"SCR\":\"SCR\",\"SGD\":\"SGD\",\"SBD\":\"SBD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TRY\":\"TRY\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"USD\":\"USD\",\"VUV\":\"VUV\",\"VND\":\"VND\",\"XOF\":\"XOF\",\"YER\":\"YER\"}}', '{\"approved_url\":\"ipn\"}', '[\"AFN\",\"ARS\"]', '[{\"name\":\"AFN\",\"currency_symbol\":\"AFN\",\"conversion_rate\":\"0.63\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(14, 'authorizenet', 'Authorize.Net', 27, 'gateway/kY6uyYr0nPgU0SyM69Yy4ei7aAowCu.avif', 'local', 0, '{\"login_id\":\"\",\"current_transaction_key\":\"\"}', '{\"0\":{\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"USD\":\"USD\"}}', NULL, '[\"AUD\",\"CAD\"]', '[{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"2.3\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"5\"},{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"2.5\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0.5\",\"fixed_charge\":\"5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(16, 'payumoney', 'PayUmoney', 22, 'gateway/ampDJJ0UuC0jlcDXJHAcnRiw4fLTdT.webp', 'local', 0, '{\"merchant_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"INR\":\"INR\"}}', NULL, '[\"INR\"]', '[{\"name\":\"INR\",\"currency_symbol\":\"INR\",\"conversion_rate\":\"0.76\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(17, 'mercadopago', 'Mercado Pago', 13, 'gateway/KpA16QNPc9Z19FXah3wKDvRI495QsO.webp', 'local', 0, '{\"access_token\":\"\"}', '{\"0\":{\"ARS\":\"ARS\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"DOP\":\"DOP\",\"EUR\":\"EUR\",\"GTQ\":\"GTQ\",\"HNL\":\"HNL\",\"MXN\":\"MXN\",\"NIO\":\"NIO\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PYG\":\"PYG\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VES\":\"VES\"}}', NULL, '[\"ARS\"]', '[{\"name\":\"ARS\",\"currency_symbol\":\"ARS\",\"conversion_rate\":\"3.24\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(18, 'coingate', 'Coingate', 14, 'gateway/ygcem6ozkAPmDRhs3teepCwBbFlZdC.webp', 'local', 0, '{\"api_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"EUR\":\"EUR\"}}', NULL, '[\"USD\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'test', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(19, 'coinbasecommerce', 'Coinbase Commerce', 15, 'gateway/BcJivOzEHHcAQlVxNtQblxw53ypeqf.webp', 'local', 0, '{\"api_key\":\"\",\"secret\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}}', '{\"webhook\":\"ipn\"}', '[\"AED\",\"ALL\"]', '[{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"ALL\",\"currency_symbol\":\"ALL\",\"conversion_rate\":\"0.85\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(20, 'monnify', 'Monnify', 16, 'gateway/n3Uy9bFd9Haw9h5o7qcYGoXkxQFf6W.webp', 'local', 0, '{\"api_key\":\"\",\"secret_key\":\"\",\"contract_code\":\"\"}', '{\"0\":{\"NGN\":\"NGN\"}}', NULL, '[\"NGN\"]', '[{\"name\":\"NGN\",\"currency_symbol\":\"NGN\",\"conversion_rate\":\"7.40\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(22, 'coinpayments', 'CoinPayments', 17, 'gateway/RV3EUwmZ2IRQ3Jrt9IzxmS0i0BhOBG.webp', 'local', 0, '{\"merchant_id\":\"\",\"private_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"},\"1\":{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}}', '{\"callback\":\"ipn\"}', '[\"USD\",\"AUD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AUD\",\"currency_symbol\":\"AUD\",\"conversion_rate\":\"0.014\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(23, 'blockchain', 'Blockchain', 32, 'gateway/20zn8YG4VPgOUSBQHvj0GeKMHwL4ZY.avif', 'local', 0, '{\"api_key\":\"\",\"xpub_code\":\"\"}', '{\"1\":{\"BTC\":\"BTC\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"50\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2020-09-10 03:05:02', '2024-12-09 13:19:34'),
(25, 'cashmaal', 'cashmaal', 33, 'gateway/7Y3IZE7VY61XHwNxRzrgWVFZx8zUu0.avif', 'local', 0, '{\"web_id\":\"\",\"ipn_key\":\"\"}', '{\"0\":{\"PKR\":\"PKR\",\"USD\":\"USD\"}}', '{\"ipn_url\":\"ipn\"}', '[\"PKR\",\"USD\"]', '[{\"name\":\"PKR\",\"currency_symbol\":\"PKR\",\"conversion_rate\":\"2.56\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, NULL, '2024-12-09 13:19:34'),
(26, 'midtrans', 'Midtrans', 30, 'gateway/7fRFCClfGcMefCb35AVzgnEJevUi37.avif', 'local', 0, '{\"client_key\":\"\",\"server_key\":\"\"}', '{\"0\":{\"IDR\":\"IDR\"}}', '{\"payment_notification_url\":\"ipn\", \"finish redirect_url\":\"ipn\", \"unfinish redirect_url\":\"failed\",\"error redirect_url\":\"failed\"}', '[\"IDR\",\"USD\"]', '[{\"name\":\"IDR\",\"currency_symbol\":\"IDR\",\"conversion_rate\":\"141.38\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"100000\",\"percentage_charge\":\"1.5\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(27, 'peachpayments', 'peachpayments', 28, 'gateway/4aJggeZFR2SBLYMw9DewRUOByPaRez.avif', 'local', 0, '{\"Authorization_Bearer\":\"\",\"Entity_ID\":\"\",\"Recur_Channel\":\"\"}', '{\"0\":{\"AED\":\"AED\",\"AFA\":\"AFA\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AWG\":\"AWG\",\"AZM\":\"AZM\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYR\":\"BYR\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CYP\":\"CYP\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EEK\":\"EEK\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GBP\":\"GBP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHC\":\"GHC\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"INR\":\"INR\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LTL\":\"LTL\",\"LVL\":\"LVL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MTL\":\"MTL\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"MZM\":\"MZM\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PTS\":\"PTS\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDD\":\"SDD\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SHP\":\"SHP\",\"SIT\":\"SIT\",\"SKK\":\"SKK\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SPL\":\"SPL\",\"SRD\":\"SRD\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMM\":\"TMM\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRL\":\"TRL\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TVD\":\"TVD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZAR\":\"ZAR\",\"ZMK\":\"ZMK\",\"ZWD\":\"ZWD\"}}', NULL, '[\"CAD\",\"AED\"]', '[{\"name\":\"CAD\",\"currency_symbol\":\"CAD\",\"conversion_rate\":\"0.012\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"AED\",\"currency_symbol\":\"AED\",\"conversion_rate\":\"0.033\",\"min_limit\":\"1\",\"max_limit\":\"10000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-09 03:05:02', '2024-12-09 13:19:34'),
(28, 'nowpayments', 'Nowpayments', 19, 'gateway/Z5wvvbRZN7nZUC6GgPTqMyf1lM2WBf.avif', 'local', 0, '{\"api_key\":\"\"}', '{\"1\":{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}}', '{\"cron\":\"ipn\"}', '[\"ETH\"]', '[{\"name\":\"ETH\",\"currency_symbol\":\"ETH\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"10\",\"max_limit\":\"500000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(29, 'khalti', 'Khalti Payment', 5, 'gateway/x4BeAPBkYuM494NvWfAkrxTfk1tbUt.avif', 'local', 0, '{\"secret_key\":\"\",\"public_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(30, 'swagger', 'MAGUA PAY', 18, 'gateway/j8bFL5e5LOn6YkquKQiy6com8w1uj2.avif', 'local', 0, '{\"MAGUA_PAY_ACCOUNT\":\"\",\"MerchantKey\":\"\",\"Secret\":\"\"}', '{\"0\":{\"EUR\":\"EUR\"}}', NULL, '[\"EUR\"]', '[{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(31, 'freekassa', 'Free kassa', 29, 'gateway/VqJR12ZLuhmisIpUbpm6p2OCqm4hHC.avif', 'local', 0, '{\"merchant_id\":\"\",\"merchant_key\":\"\",\"secret_word\":\"\",\"secret_word2\":\"\"}', '{\"0\":{\"RUB\":\"RUB\",\"USD\":\"USD\",\"EUR\":\"EUR\",\"UAH\":\"UAH\",\"KZT\":\"KZT\"}}', '{\"ipn_url\":\"ipn\"}', '[\"RUB\",\"USD\"]', '[{\"name\":\"RUB\",\"currency_symbol\":\"RUB\",\"conversion_rate\":\"0.81\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(32, 'konnect', 'Konnect', 24, 'gateway/DIWitJin1UBjkwTLrSPcstnUDGmTz3.avif', 'local', 0, '{\"api_key\":\"\",\"receiver_wallet_Id\":\"\"}', '{\"0\":{\"TND\":\"TND\",\"EUR\":\"EUR\",\"USD\":\"USD\"}}', '{\"webhook\":\"ipn\"}', '[\"USD\",\"TND\",\"EUR\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"},{\"name\":\"TND\",\"currency_symbol\":\"TND\",\"conversion_rate\":\"0.028\",\"min_limit\":\"1\",\"max_limit\":\"20000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"name\":\"EUR\",\"currency_symbol\":\"EUR\",\"conversion_rate\":\"0.0083\",\"min_limit\":\"1\",\"max_limit\":\"60000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(33, 'mypay', 'Mypay Np', 25, 'gateway/kkBeSnA5MFdlLrrSOpF3dJp1JwMxIB.avif', 'local', 0, '{\"merchant_username\":\"\",\"merchant_api_password\":\"\",\"merchant_id\":\"\",\"api_key\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 1, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(35, 'imepay', 'IME PAY', 8, 'gateway/YuBFrsBWuxf17sqB6z8y039xgdxyat.avif', 'local', 0, '{\"MerchantModule\":\"\",\"MerchantCode\":\"\",\"username\":\"\",\"password\":\"\"}', '{\"0\":{\"NPR\":\"NPR\"}}', NULL, '[\"NPR\"]', '[{\"name\":\"NPR\",\"currency_symbol\":\"NPR\",\"conversion_rate\":\"1.21\",\"min_limit\":\"10\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"1.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, '', '2020-09-08 21:05:02', '2024-12-09 13:19:34'),
(36, 'cashonexHosted', 'Cashonex Hosted', 11, 'gateway/GAcL1CamWpPaeDGaD6aSInqXknXK50.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:31:33', '2024-12-09 13:19:34'),
(37, 'cashonex', 'cashonex', 4, 'gateway/rbbey8zLDMKdNPftwRdOSY79eVEGLi.avif', 'local', 0, '{\"idempotency_key\":\"\",\"salt\":\"\"}', '{\"0\":{\"USD\":\"USD\"}}', NULL, '[\"USD\"]', '[{\"name\":\"USD\",\"currency_symbol\":\"USD\",\"conversion_rate\":\"0.0091\",\"min_limit\":\"1\",\"max_limit\":\"15000\",\"percentage_charge\":\"0.0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, NULL, '2023-04-02 18:34:54', '2024-12-09 13:19:34'),
(38, 'binance', 'Binance', 31, 'gateway/bZ7w2koAzATHG9gp8k6JzRhhusXTpH.avif', 'local', 0, '{\"mercent_api_key\":\"\",\"mercent_secret\":\"\"}', '{\"1\":{\"ADA\":\"ADA\",\"ATOM\":\"ATOM\",\"AVA\":\"AVA\",\"BCH\":\"BCH\",\"BNB\":\"BNB\",\"BTC\":\"BTC\",\"BUSD\":\"BUSD\",\"CTSI\":\"CTSI\",\"DASH\":\"DASH\",\"DOGE\":\"DOGE\",\"DOT\":\"DOT\",\"EGLD\":\"EGLD\",\"EOS\":\"EOS\",\"ETC\":\"ETC\",\"ETH\":\"ETH\",\"FIL\":\"FIL\",\"FRONT\":\"FRONT\",\"FTM\":\"FTM\",\"GRS\":\"GRS\",\"HBAR\":\"HBAR\",\"IOTX\":\"IOTX\",\"LINK\":\"LINK\",\"LTC\":\"LTC\",\"MANA\":\"MANA\",\"MATIC\":\"MATIC\",\"NEO\":\"NEO\",\"OM\":\"OM\",\"ONE\":\"ONE\",\"PAX\":\"PAX\",\"QTUM\":\"QTUM\",\"STRAX\":\"STRAX\",\"SXP\":\"SXP\",\"TRX\":\"TRX\",\"TUSD\":\"TUSD\",\"UNI\":\"UNI\",\"USDC\":\"USDC\",\"USDT\":\"USDT\",\"WRX\":\"WRX\",\"XLM\":\"XLM\",\"XMR\":\"XMR\",\"XRP\":\"XRP\",\"XTZ\":\"XTZ\",\"XVS\":\"XVS\",\"ZEC\":\"ZEC\",\"ZIL\":\"ZIL\"}}', NULL, '[\"BTC\"]', '[{\"name\":\"BTC\",\"currency_symbol\":\"BTC\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 0, 0, 'live', NULL, NULL, '2023-04-02 19:36:14', '2024-12-09 13:19:34'),
(39, 'cinetpay', 'CinetPay ', 23, 'gateway/9WCd4Kn4EvlDX8y4V3bEV7eazCTlla.avif', 'local', 0, '{\"apiKey\":\"\",\"site_id\":\"\"}', '{\"0\":{\"XOF\":\"XOF\",\"XAF\":\"XAF\",\"CDF\":\"CDF\",\"GNF\":\"GNF\",\"USD\":\"USD\"}}', 'NULL', '[\"XOF\"]', '[{\"name\":\"XOF\",\"currency_symbol\":\"XOF\",\"conversion_rate\":\"5.45\",\"min_limit\":\"1\",\"max_limit\":\"50000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0.5\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'test', NULL, NULL, '2023-04-02 19:36:14', '2024-12-09 13:19:34'),
(1000, 'bank-transfer', 'Bank Transfer', 1, 'gateway/A2zYpiPKpPWcByCCys7mpnCugQEHvv.avif', 'local', 1, '{\"account_number\":{\"field_name\":\"account_number\",\"field_label\":\"Account Number\",\"type\":\"text\",\"validation\":\"required\"},\"beneficiary_name\":{\"field_name\":\"beneficiary_name\",\"field_label\":\"Beneficiary Name\",\"type\":\"text\",\"validation\":\"required\"},\"nid\":{\"field_name\":\"nid\",\"field_label\":\"NID\",\"type\":\"file\",\"validation\":\"required\"},\"address\":{\"field_name\":\"address\",\"field_label\":\"Address\",\"type\":\"text\",\"validation\":\"required\"}}', NULL, NULL, '[\"USD\",\"EUR\"]', '[{\"currency\":\"USD\",\"conversion_rate\":\"1\",\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"},{\"currency\":\"EUR\",\"conversion_rate\":0.9,\"min_limit\":\"1\",\"max_limit\":\"1000\",\"percentage_charge\":\"0\",\"fixed_charge\":\"0\"}]', 'Send form your payment gateway. your bank may charge you a cash advance fee.', 1, 0, 'live', NULL, 'Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.Send form your payment gateway. your bank may charge you a cash advance fee.', NULL, '2024-09-18 11:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `in_app_notifications`
--

CREATE TABLE `in_app_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `in_app_notificationable_id` int(11) NOT NULL,
  `in_app_notificationable_type` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kycs`
--

CREATE TABLE `kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `input_form` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1 => Active, 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycs`
--

INSERT INTO `kycs` (`id`, `name`, `slug`, `input_form`, `status`, `created_at`, `updated_at`) VALUES
(12, 'NID Vefication', 'nid-vefication', '{\"full_name\":{\"field_name\":\"full_name\",\"field_label\":\"Full Name\",\"type\":\"text\",\"validation\":\"required\"},\"fathers_name\":{\"field_name\":\"fathers_name\",\"field_label\":\"Father\'s Name\",\"type\":\"text\",\"validation\":\"required\"},\"mothers_name\":{\"field_name\":\"mothers_name\",\"field_label\":\"Mother\'s Name\",\"type\":\"text\",\"validation\":\"required\"},\"number\":{\"field_name\":\"number\",\"field_label\":\"Number\",\"type\":\"number\",\"validation\":\"required\"},\"address\":{\"field_name\":\"address\",\"field_label\":\"Address\",\"type\":\"textarea\",\"validation\":\"required\"},\"date_of_birth\":{\"field_name\":\"date_of_birth\",\"field_label\":\"Date Of Birth\",\"type\":\"date\",\"validation\":\"required\"}}', 0, '2023-09-26 20:53:50', '2024-07-10 14:50:05'),
(13, 'Address Verification', 'address-verification', '{\"name\":{\"field_name\":\"name\",\"field_label\":\"Name\",\"type\":\"text\",\"validation\":\"required\"},\"permanent_address\":{\"field_name\":\"permanent_address\",\"field_label\":\"Permanent Address\",\"type\":\"text\",\"validation\":\"required\"}}', 0, '2023-10-22 02:35:17', '2024-07-10 14:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `flag_driver` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => Inactive, 1 => Active',
  `rtl` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => Inactive, 1 => Active ',
  `default_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `flag`, `flag_driver`, `status`, `rtl`, `default_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'language/mJPLAndu3pCSydXVCmxjVxr34dt2YnlAAqCvXi4W.jpg', 'local', 1, 0, 1, '2023-06-16 22:35:53', '2024-02-28 04:23:25'),
(2, 'Spanish', 'es', 'language/gwlunC4awvhHW5aJ4KsAYDiXHwePEfPXqtVq1WQr.jpg', 'local', 1, 0, 0, '2023-06-16 22:10:02', '2024-02-28 09:32:23');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_modes`
--

CREATE TABLE `maintenance_modes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_modes`
--

INSERT INTO `maintenance_modes` (`id`, `heading`, `description`, `image`, `image_driver`, `created_at`, `updated_at`) VALUES
(1, 'The website under maintenance!', 'Someone has kidnapped our site. We are negotiation ransom and will resolve this issue in 24/7 hours<br>', 'maintenanceMode/3jXAnm42OZuYy3kVDcHKUjW3gyiG8eSo96rlgg19.png', 'local', '2023-10-03 22:44:32', '2023-10-04 00:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `manage_menus`
--

CREATE TABLE `manage_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_section` varchar(50) DEFAULT NULL,
  `menu_items` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manage_menus`
--

INSERT INTO `manage_menus` (`id`, `menu_section`, `menu_items`, `created_at`, `updated_at`) VALUES
(3, 'header', '[\"home\",\"about\",\"blogs\",\"faq\",\"contact\"]', '2023-10-15 20:54:10', '2024-07-07 09:14:33'),
(4, 'footer', '{\"useful_link\":[\"home\",\"about\",\"blogs\",\"faq\",\"contact\"],\"support_link\":[\"terms conditions\",\"privacy policy\",\"cookie policy\"]}', '2023-10-15 20:54:10', '2024-07-02 12:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `manual_sms_configs`
--

CREATE TABLE `manual_sms_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action_method` varchar(255) DEFAULT NULL,
  `action_url` varchar(255) DEFAULT NULL,
  `header_data` text DEFAULT NULL,
  `param_data` text DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manual_sms_configs`
--

INSERT INTO `manual_sms_configs` (`id`, `action_method`, `action_url`, `header_data`, `param_data`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'POST', 'https://rest.nexmo.com/sms/json', '{\"Content-Type\":\"application\\/x-www-form-urlencoded\"}', NULL, '{\"from\":\"Rownak\",\"text\":\"[[message]]\",\"to\":\"[[receiver]]\",\"api_key\":\"930cc608\",\"api_secret\":\"2pijsaMOUw5YKOK5\"}', NULL, '2023-10-19 03:03:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_07_064911_create_admins_table', 2),
(6, '2014_10_12_100000_create_password_resets_table', 3),
(7, '2023_06_10_061241_create_basic_controls_table', 4),
(8, '2023_06_10_123329_create_file_storages_table', 4),
(9, '2023_06_15_102426_create_firebase_notifies_table', 5),
(10, '2023_06_17_085447_create_languages_table', 6),
(11, '2023_06_19_082042_create_sms_controls_table', 7),
(12, '2023_06_20_080624_create_support_tickets_table', 8),
(13, '2023_06_20_080731_create_support_ticket_messages_table', 8),
(14, '2023_06_20_080833_create_support_ticket_attachments_table', 8),
(15, '2023_06_20_212143_create_fire_base_tokens_table', 9),
(16, '2023_06_21_124322_create_in_app_notifications_table', 10),
(17, '2023_06_22_084256_create_gateways_table', 11),
(18, '2023_07_15_162549_create_kycs_table', 12),
(19, '2023_07_17_094844_create_manage_pages_table', 13),
(20, '2023_07_17_101515_create_manage_sections_table', 14),
(21, '2023_07_18_084411_create_pages_table', 15),
(22, '2023_07_22_130913_create_manage_menus_table', 16),
(23, '2023_07_26_193156_create_email_controls_table', 17),
(24, '2023_08_10_153005_create_google_sheet_apis_table', 18),
(25, '2023_08_20_140757_create_contents_table', 19),
(26, '2023_08_20_140808_create_content_details_table', 19),
(27, '2023_08_20_140815_create_content_media_table', 19),
(28, '2023_09_07_151706_create_user_logins_table', 20),
(29, '2023_09_09_105217_create_transactions_table', 21),
(32, '2023_09_19_131540_create_deposits_table', 22),
(33, '2023_09_20_093121_create_payouts_table', 23),
(34, '2023_09_21_085103_create_wallets_table', 24),
(35, '2023_10_01_125109_create_pages_table', 25),
(36, '2023_10_02_162152_create_page_details_table', 26),
(37, '2023_10_04_102054_create_maintenance_modes_table', 27),
(38, '2023_10_05_124404_create_email_templates_table', 28),
(39, '2023_10_05_124445_create_notify_templates_table', 28),
(40, '2023_10_05_132313_create_email_sms_templates_table', 29),
(41, '2023_10_05_145420_create_push_notification_templates_table', 30),
(42, '2023_10_05_150447_create_in_app_notification_templates_table', 31),
(43, '2023_10_19_140559_create_manual_sms_configs_table', 32),
(44, '2023_10_19_161530_create_jobs_table', 33),
(45, '2023_12_05_124039_create_blog_categories_table', 34),
(46, '2023_12_06_154935_create_subscribers_table', 35),
(51, '2023_12_12_181708_create_blogs_table', 38),
(52, '2023_12_12_181730_create_blog_details_table', 38),
(57, '2020_07_07_055656_create_countries_table', 39),
(58, '2020_07_07_055725_create_cities_table', 39),
(59, '2021_10_19_071730_create_states_table', 39),
(60, '2021_10_23_082414_create_currencies_table', 39),
(62, '2024_01_03_124746_create_banks_table', 40),
(67, '2024_01_14_152009_create_country_services_table', 42),
(75, '2024_01_29_185845_create_virtual_card_methods_table', 44),
(76, '2024_01_30_122822_create_virtual_card_orders_table', 45),
(77, '2024_01_31_130214_create_two_factor_settings_table', 46),
(78, '2024_01_31_131012_create_virtual_card_transactions_table', 46),
(79, '2024_01_03_121129_create_recipients_table', 47),
(82, '2024_02_19_152226_create_notification_permissions_table', 49),
(84, '2024_01_24_191611_create_money_transfers_table', 50),
(88, '2024_04_03_131610_create_user_wallets_table', 51),
(89, '2024_06_08_104304_create_user_kycs_table\r\n', 51),
(90, '2024_06_08_104304_create_user_kycs_table', 52),
(91, '2020_07_07_055746_create_timezones_table', 53),
(92, '2022_01_22_034939_create_languages_table', 54),
(93, '2024_06_08_121015_create_razorpay_contacts_table', 55),
(94, '2024_06_09_173825_create_notification_templates_table', 56),
(95, '2024_06_11_131957_create_money_requests_table', 57),
(96, '2024_09_07_163355_add_columns_to_tables', 58),
(99, '2024_10_24_112308_version1_3', 58),
(100, '2024_10_28_192906_version1_4', 59),
(101, '2024_12_04_110818_drop_foreign_keys_from_multiple_tables', 60);

-- --------------------------------------------------------

--
-- Table structure for table `money_requests`
--

CREATE TABLE `money_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requester_id` bigint(20) NOT NULL,
  `recipient_id` bigint(20) NOT NULL,
  `wallet_uuid` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending,1=success,2=>rejected',
  `trx_id` varchar(255) DEFAULT NULL COMMENT 'transaction id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `recipient_id` bigint(20) UNSIGNED NOT NULL,
  `r_user_id` int(11) DEFAULT NULL COMMENT 'Recipient User Id',
  `send_currency_id` bigint(20) DEFAULT NULL COMMENT 'Country ID',
  `receive_currency_id` bigint(20) DEFAULT NULL COMMENT 'Country ID',
  `service_id` bigint(20) DEFAULT NULL COMMENT 'Service Id',
  `send_amount` decimal(18,8) DEFAULT NULL,
  `fees` decimal(18,8) DEFAULT NULL,
  `payable_amount` decimal(18,8) DEFAULT NULL,
  `sender_currency` varchar(10) DEFAULT NULL COMMENT 'Currency Code',
  `rate` decimal(18,8) DEFAULT NULL,
  `recipient_get_amount` decimal(18,8) DEFAULT NULL,
  `receiver_currency` varchar(10) DEFAULT NULL COMMENT 'Currency Code',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=> Draft/Initiate, 1=> Completed, 2=> Awaiting, 3=> Rejected',
  `payment_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=> Pending, 1=> Completed, 3=> Rejected',
  `resubmitted` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> No, 1=> Yes',
  `reason` text DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `user_information` text DEFAULT NULL,
  `trx_id` varchar(255) DEFAULT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_permissions`
--

CREATE TABLE `notification_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notifyable_id` int(11) DEFAULT NULL,
  `notifyable_type` varchar(255) DEFAULT NULL,
  `template_email_key` text DEFAULT NULL,
  `template_sms_key` text DEFAULT NULL,
  `template_in_app_key` text DEFAULT NULL,
  `template_push_key` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `template_key` varchar(255) DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `short_keys` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `sms` text DEFAULT NULL,
  `in_app` text DEFAULT NULL,
  `push` text DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL COMMENT 'mail = 0(inactive), mail = 1(active),\r\nsms = 0(inactive), sms = 1(active),\r\nin_app = 0(inactive), in_app = 1(active),\r\npush = 0(inactive), push = 1(active),\r\n ',
  `notify_for` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 => user, 1 => admin',
  `user_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=>NO, 1=>YES',
  `lang_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `language_id`, `name`, `email_from`, `template_key`, `subject`, `short_keys`, `email`, `sms`, `in_app`, `push`, `status`, `notify_for`, `user_show`, `lang_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Profile Update', 'admin@bugfinder.net', 'PROFILE_UPDATE', 'Your Profile has updated', '[]', 'Your profile has been updated', 'Your profile has been updated', 'Your profile has been updated', 'Your profile has been updated', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2021-08-02 12:05:43', '2024-08-14 05:08:19'),
(2, 1, 'Profile Update', 'admin@bugfinder.net', 'PROFILE_UPDATE', 'Your Profile has updated', '[]', 'Your profile has been updated', 'Your profile has been updated', 'Your profile has been updated', 'Your profile has been updated', '{\"mail\":\"0\",\"sms\":\"1\",\"in_app\":\"0\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 03:26:59', '2024-07-10 14:46:32'),
(5, 1, 'Support Ticket Create', 'admin@bugfinder.net', 'SUPPORT_TICKET_CREATE', 'New Support Ticket', '{\"ticket_id\":\"Support Ticket ID\",\"username\":\"username\"}', '[[username]] create a ticket\nTicket : [[ticket_id]]\n', '[[username]] create a ticket\nTicket : [[ticket_id]]\n', '[[username]] create a ticket\nTicket : [[ticket_id]]', '[[username]] create a ticket\nTicket : [[ticket_id]]\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2021-08-02 12:05:43', '2024-07-10 14:46:32'),
(9, 1, 'Balance Deducted by Admin', 'admin@bugfinder.net', 'DEDUCTED_BALANCE', 'Your Account has been debited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] debited in your account.\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] debited in your account.\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] debited in your account.\n\nYour Current Balance [[main_balance]].\n\nTransaction: #[[transaction]]\n', '[[amount]] debited in your account.\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(10, 1, 'Balance Credited By Admin', 'admin@bugfinder.net', 'ADD_BALANCE', 'Your Account has been credited', '{\"transaction\":\"Transaction Number\",\"amount\":\"Amount By Admin\",\"main_balance\":\"Users Balance After this operation\"}', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '[[amount]] credited in your account. \n\n\nYour Current Balance [[main_balance]]\n\nTransaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(11, 1, 'KYC Approval', 'admin@bugfinder.net', 'KYC_APPROVED', 'Your KYC has been approved', '[]', 'Your KYC has been approved', 'Your KYC has been approved', 'Your KYC has been approved', 'Your KYC has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(12, 1, 'KYC Rejection', 'admin@bugfinder.net', 'KYC_REJECTED', 'Your KYC has been rejected', '[]', 'Your KYC has been rejected', 'Your KYC has been rejected', 'Your KYC has been rejected', 'Your KYC has been rejected', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(13, 1, 'Admin Replied Ticket', 'admin@bugfinder.net', 'ADMIN_REPLIED_TICKET', 'Admin Replied Ticket', '{\"ticket_id\":\"Support Ticket ID\"}', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', 'Admin replied  \r\nTicket : [[ticket_id]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(15, 1, 'Payment Request', 'admin@bugfinder.net', 'PAYMENT_REQUEST', 'Payment Request', '{\"gateway\":\"gateway\",\"currency\":\"currency\",\"username\":\"username\"}', '[[username]] deposit request [[amount]] via [[gateway]]\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '[[username]] deposit request [[amount]] via [[gateway]]\r\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(16, 1, 'Payment Approved', 'admin@bugfinder.net', 'PAYMENT_APPROVED', 'Payment Approved', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\"}', '[[username]] deposit request [[amount]] via [[gateway]] has been approved\n', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '[[username]] deposit request [[amount]] via [[gateway]] has been approved', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(17, 1, 'Payment Rejection', 'admin@bugfinder.net', 'PAYMENT_REJECTED', 'Payment Rejected', '{\"amount\":\"amount\",\"feedback\":\"Admin feedback\"}', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected\n', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected\n', '[[username]] deposit request [[amount]] via [[gateway]] payment rejected\n', '[[username]] deposit request [[amount]] via [[gateway]]\n', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(18, 1, 'Deposit', 'admin@bugfinder.net', 'ADD_FUND_USER_USER', 'Add Fund User', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 'You have deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', 'You have deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', 'You have deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', 'You have deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(19, 1, 'Add Fund User Admin', 'admin@bugfinder.net', 'ADD_FUND_USER_ADMIN', 'Add Fund User Admin', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\",\"username\":\"username\"}', '[[username]] has deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '[[username]] has deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '[[username]] has deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '[[username]] has deposited money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(22, 1, 'Money Transfer Request Approve', 'admin@bugfinder.net', 'TRANSFER_APPROVED', 'Transfer Request Approved', '{\"amount\":\"Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'You transfer request has been approved . Transaction: #[[transaction]]', 'You transfer request has been approved . Transaction: #[[transaction]]', 'You transfer request has been approved . Transaction: #[[transaction]]', 'You transfer request has been approved . Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(23, 1, 'Money Transfer Request Cancel', 'admin@bugfinder.net', 'TRANSFER_CANCEL', 'Transfer Request Cancel', '{\"amount\":\"Amount\",\"currency\":\"Transfer Currency\",\"transaction\":\"Transaction Number\"}', 'Your Transfer request for amount [[amount]] [[currency]] has been canceled. Transaction: #[[transaction]]', 'Your Transfer request for amount [[amount]] [[currency]] has been canceled. Transaction: #[[transaction]]', 'Your Transfer request for amount [[amount]] [[currency]] has been canceled. Transaction: #[[transaction]]', 'Your Transfer request for amount [[amount]] [[currency]] has been canceled. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(24, 1, 'Verification Code', 'admin@bugfinder.net', 'VERIFICATION_CODE', 'Verify Your Email ', '{\"code\":\"code\"}', 'Your Email verification Code  [[code]]', 'Your Email verification Code  [[code]]', 'Your Email verification Code  [[code]]', 'Your Email verification Code  [[code]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(25, 1, 'Admin Virtual Card Apply', 'admin@bugfinder.net', 'ADMIN_VIRTUAL_CARD_APPLY', 'Virtual Card Applied', '{\"amount\":\"amount\",\"currency\":\"currency\",\"username\":\"username\",\"transaction\":\"transaction\"}', '[[username]] requested for a virtual card. Payment Amount [[amount]][[currency]].\r\nTransaction [[transaction]].', '[[username]] requested for a virtual card. Payment Amount [[amount]][[currency]].\r\nTransaction [[transaction]].', '[[username]] requested for a virtual card. Payment Amount [[amount]] [[currency]].\nTransaction [[transaction]].', '[[username]] requested for a virtual card. Payment Amount [[amount]][[currency]].\r\nTransaction [[transaction]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(26, 1, 'Two Step Enabled', 'admin@bugfinder.net', 'TWO_STEP_ENABLED', 'TWO STEP ENABLED', '{\"action\":\"action\",\"code\":\"code\",\"username\":\"username\"}', 'Two Fa [[action]] by [[username]] ', 'Two Fa [[action]] by [[username]] ', 'Two Fa [[action]] by [[username]] ', 'Two Fa [[action]] by [[username]] ', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(27, 1, 'Money Transfer Admin', 'admin@bugfinder.net', 'MONEY_TRANSFER_ADMIN', 'Money Transfer Admin', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', '[[username]] has transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '[[username]] has transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '[[username]] has transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '[[username]] has transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 1, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(28, 1, 'Money Transfer', 'admin@bugfinder.net', 'MONEY_TRANSFER_USER', 'Money Transfer User', '{\"amount\":\"Request Amount\",\"currency\":\"Request Currency\",\"transaction\":\"Transaction Number\"}', 'You have transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', 'You have transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', 'You have transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', 'You have transferred money amount [[amount]] [[currency]]. Transaction: #[[transaction]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(31, 1, 'Money Transfer OTP', 'admin@bugfinder.net', 'USER_TRANSFER_OTP', 'Money Transfer OTP', '{\"otp\":\"otp\",\"transaction\":\"transaction\"}', '[[otp]] is your money transfer verifiaction OTP.', '[[otp]] is your money transfer verifiaction OTP.', '[[otp]] is your money transfer verifiaction OTP.', '[[otp]] is your money transfer verifiaction OTP.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"0\",\"push\":\"0\"}', 0, 0, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(32, 1, 'Password Reset', 'admin@bugfinder.net', 'PASSWORD_RESET', 'Reset Your Password', '{\"message\":\"message\"}', 'You are receiving this email because we received a password reset request for your account.[[message]]\n\n\nThis password reset link will expire in 60 minutes.\n\nIf you did not request a password reset, no further action is required.', '', '', '', '{\"mail\":\"1\",\"sms\":\"0\",\"in_app\":\"0\",\"push\":\"0\"}', 0, 0, 'en', '2023-10-07 16:18:47', '2024-07-10 14:46:32'),
(33, 1, 'Welcome New User', 'admin@bugfinder.net', 'WELCOME_NEW_USER', 'Welcome New User', '{\"user\":\"username\"}', 'Welcome,[[user]]!\r\n\r\nThank you for registering at our platform. We are excited to have you on board.\r\n', 'Welcome,[[user]]!\r\n\r\nThank you for registering at our platform. We are excited to have you on board.', 'Welcome,[[user]]!\r\n\r\nThank you for registering at our platform. We are excited to have you on board.', 'Welcome,[[user]]!\r\n\r\nThank you for registering at our platform. We are excited to have you on board.', '{\"mail\":\"1\",\"sms\":\"0\",\"in_app\":\"0\",\"push\":\"0\"}', 0, 0, 'en', '2023-10-07 16:18:47', '2024-07-10 14:46:32'),
(35, 1, 'Virtual Card Apply', 'admin@bugfinder.net', 'VIRTUAL_CARD_APPLY', 'Virtual Card Applied', '{\"amount\":\"amount\",\"currency\":\"currency\",\"transaction\":\"transaction\"}', 'You have requested for a virtual card. Payment Amount [[amount]][[currency]].\r\nTransaction [[transaction]].', 'You have requested for a virtual card. Payment Amount [[amount]][[currency]].\r\nTransaction [[transaction]].', 'You have requested for a virtual card. Payment Amount [[amount]] [[currency]].\nTransaction [[transaction]].', 'You have requested for a virtual card. Payment Amount [[amount]][[currency]].\r\nTransaction [[transaction]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(36, 1, 'Virtual Card Reject', 'admin@bugfinder.net', 'VIRTUAL_CARD_REJECTED', 'Virtual Card Rejected', '{\"amount\":\"amount\",\"currency\":\"currency\",\"transaction\":\"transaction\"}', 'Amount [[amount]] [[currency]] returned for virtual card reject. Transaction [[transaction]].', 'Amount [[amount]][[currency]] returned for virtual card reject. Transaction [[transaction]].', 'Amount [[amount]] [[currency]] returned for virtual card reject. Transaction [[transaction]].', 'Amount [[amount]][[currency]] returned for virtual card reject. Transaction [[transaction]].', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(37, 1, 'Virtual Card Approve', 'admin@bugfinder.net', 'VIRTUAL_CARD_APPROVE', 'Virtual Card Approved', '{\"name_on_card\":\"name_on_card\",\"card_id\":\"card_id\",\"cvv\":\"cvv\",\"card_number\":\"card_number\",\"brand\":\"brand\",\"expiry_date\":\"expiry_date\",\"balance\":\"balance\",\"currency\":\"currency\"}', 'Virtual card request has been approved. Card Number[[card_number]] balance [[balance]] expiry on [[expiry_date]]', 'Virtual card request has been approved. Card Number[[card_number]] balance [[balance]] expiry on [[expiry_date]]', 'Virtual card request has been approved. Card Number[[card_number]] balance [[balance]] expiry on [[expiry_date]]', 'Virtual card request has been approved. Card Number[[card_number]] balance [[balance]] expiry on [[expiry_date]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(38, 1, 'Virtual Card Block', 'admin@bugfinder.net', 'VIRTUAL_CARD_BLOCK', 'Virtual Card Blocked', '{\"cardNumber\":\"cardNumber\"}', 'Your Card has been blocked card number-[[cardNumber]]', 'Your Card has been blocked card number-[[cardNumber]]', 'Your Card has been blocked card number-[[cardNumber]]', 'Your Card has been blocked card number-[[cardNumber]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(39, 1, 'Virtual Card UnBlock', 'admin@bugfinder.net', 'VIRTUAL_CARD_UNBLOCK', 'Virtual Card UnBlocked', '{\"cardNumber\":\"cardNumber\"}', 'Your Card has been un-blocked card number-[[cardNumber]]', 'Your Card has been un-blocked card number-[[cardNumber]]', 'Your Card has been un-blocked card number-[[cardNumber]]', 'Your Card has been un-blocked card number-[[cardNumber]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(40, 1, 'Virtual Card Fund Approve', 'admin@bugfinder.net', 'VIRTUAL_CARD_FUND_APPROVE', 'Virtual Card Fund Approved', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"cardNumber\":\"cardNumber\"}', 'Virtual card fund request [[amount]] [[currency]] has been approved card number: [[cardNumber]]', 'Virtual card fund request [[amount]] [[currency]] has been approved card number: [[cardNumber]]', 'Virtual card fund request [[amount]] [[currency]] has been approved card number: [[cardNumber]]', 'Virtual card fund request [[amount]] [[currency]] has been approved card number: [[cardNumber]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(41, 1, 'Virtual Card Fund Return', 'admin@bugfinder.net', 'VIRTUAL_CARD_FUND_RETURN', 'Virtual Card Fund Returned', '{\"amount\":\"amount\",\"currency\":\"Request Currency\",\"cardNumber\":\"cardNumber\"}', 'Virtual card fund request [[amount]] [[currency]] has been return card number: [[cardNumber]]', 'Virtual card fund request [[amount]] [[currency]] has been return card number: [[cardNumber]]', 'Virtual card fund request [[amount]] [[currency]] has been return card number: [[cardNumber]]', 'Virtual card fund request [[amount]] [[currency]] has been return card number: [[cardNumber]]', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 22:18:47', '2024-07-10 14:46:32'),
(102, 1, 'User Log In', 'admin@bugfinder.net', 'USER_LOGIN', 'User Log In Mail', '{\"user\":\"user\"}', 'Welcome,[[user]]!\r\n\r\nYou are logged in at our platform. We are excited to have you on board.\r\n', 'Welcome,[[user]]!\r\n\r\nYou are logged in at our platform. We are excited to have you on board.', 'Welcome,[[user]]!\r\n\r\nYou are logged in at our platform. We are excited to have you on board.', 'Welcome,[[user]]!\r\n\r\nYou are logged in at our platform. We are excited to have you on board.', '{\"mail\":\"1\",\"sms\":\"1\",\"in_app\":\"1\",\"push\":\"1\"}', 0, 1, 'en', '2023-10-07 16:18:47', '2024-07-10 14:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `template_name` varchar(191) DEFAULT NULL,
  `page_title` varchar(191) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `seo_meta_image` varchar(255) DEFAULT NULL,
  `seo_meta_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_image` varchar(255) DEFAULT NULL,
  `breadcrumb_image_driver` varchar(50) DEFAULT NULL,
  `breadcrumb_status` tinyint(1) DEFAULT 1 COMMENT '0 => inactive, 1 => active',
  `status` tinyint(1) DEFAULT 1 COMMENT '0 => unpublish, 1 => publish',
  `type` tinyint(4) DEFAULT 0 COMMENT '0 => admin create, 1 => developer create, 2=> user auth, 3 => custom link',
  `custom_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `meta_robots` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `template_name`, `page_title`, `meta_title`, `meta_keywords`, `meta_description`, `seo_meta_image`, `seo_meta_image_driver`, `breadcrumb_image`, `breadcrumb_image_driver`, `breadcrumb_status`, `status`, `type`, `custom_link`, `created_at`, `updated_at`, `og_description`, `meta_robots`) VALUES
(1, 'home', '/', 'light', 'Home', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/JEBGI1FLabIvMxvyfjcDuPpQifkJle.webp', 'local', 'pagesImage/zFJvgVQwmePhdvGyfDi8QcIG53EFIt.avif', 'local', 0, 1, 0, NULL, '2023-11-30 09:30:01', '2024-12-09 12:18:41', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(2, 'about', 'about', 'light', 'About', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/Fqst8Ph2TqfZ4sPA1H7DHSxNZD8tl6.webp', 'local', 'pagesImage/JS5irgaBEKWfOMIK91Qx3TVBeQRcgl.avif', 'local', 1, 1, 0, NULL, '2023-11-30 09:33:10', '2024-10-02 12:22:10', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(4, 'faq', 'faq', 'light', 'FAQ', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/afnVxfwhn9QegcOoFC6a74p3x0ErlZ.webp', 'local', 'pagesImage/0JylxLtLxARK9noycaNJQtLfVF3W8Y.avif', 'local', 1, 1, 0, NULL, '2023-11-30 09:34:28', '2024-10-02 12:23:06', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(5, 'contact', 'contact', 'light', 'Contact', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/gAcNfAcjF8KiYBPjbTW8zuiFcZKsRS.webp', 'local', 'pagesImage/baAjsFdWZkn8i5LRVWIja3CyzeFNoL.avif', 'local', 1, 1, 0, NULL, '2023-11-30 09:35:09', '2024-10-02 12:26:39', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(21, 'blogs', 'blogs', 'light', 'Blogs', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/MMQrOkkovJkTwmuJrDz71FfeZz0jEF.webp', 'local', 'pagesImage/5iLjK4HTSJbdWKzPLRhcyOUbDWHe8M.webp', 'local', 1, 1, 1, NULL, '2023-12-12 10:47:47', '2024-10-02 13:06:21', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(23, 'login', 'login', 'light', 'LogIn', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/aF5L9iyZAK2BjtA4IxLAbOKpOS6lS1.webp', 'local', 'pagesImage/rmLkAvPFWndIxo8ERUgh7DpjMehUPr.webp', 'local', 1, 1, 2, NULL, '2024-02-14 11:26:12', '2024-10-03 05:08:38', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(24, 'register', 'register', 'light', 'Register', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/NflLSfEvEFi1yTTjnwTUFCJ8I0jxay.webp', 'local', 'pagesImage/duch2F9VPgXV5SrQ2FlnlO3tblSIP1.avif', 'local', 1, 1, 2, NULL, '2024-02-14 11:26:12', '2024-10-02 12:37:02', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(25, 'facebook', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'https://facebook.com/bugfinder.net', '2024-02-27 12:44:49', '2024-02-28 07:11:14', NULL, NULL),
(26, 'linkedin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 'https://bd.linkedin.com/', '2024-02-28 10:07:54', '2024-02-28 10:07:54', NULL, NULL),
(27, 'terms conditions', 'terms-conditions', 'light', 'Terms &amp; Conditions', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/7fQCChNMWkGRJEkH4LWL8YoilOckaN.webp', 'local', 'pagesImage/Qs2fYZMLou61V3gZFdtBzcn1oe7iKy.webp', 'local', 1, 1, 0, NULL, '2024-03-19 04:39:53', '2024-10-02 12:39:55', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(28, 'privacy policy', 'privacy-policy', 'light', 'Privacy Policy', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/4wP9RpB57yZjoedtWJoHy2223YXyHL.webp', 'local', NULL, 'local', 1, 1, 0, NULL, '2024-03-19 05:49:42', '2024-10-02 12:40:52', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow'),
(29, 'cookie policy', 'cookie-policy', 'light', 'Cookie Policy', 'Waiz Preview - Digital Wallet &amp; Remittance App | Global Money Transfer Solution', '[\"Digital Wallet System\",\"Remittance Software\",\"Money Transfer Application\",\"International Money Transfer\",\"Digital Payment Solutions\",\"Fintech Software\",\"Financial Technology App\",\"Global Remittance Platform\",\"bank\",\"bank transfer\",\"bank website\",\"banking\",\"credit card\",\"digital banking\",\"mobile banking\",\"money\",\"money transfer\",\"online banking\",\"online payment\",\"payment gateway\",\"remit\",\"transfer\",\"wallet\"]', 'Waiz is your ultimate solution for starting a global money transfer business. Our comprehensive digital wallet and remittance app offer a user-friendly interface, advanced technology, and cost-effective solutions for sending and receiving money worldwide.', 'pageSeo/pTExGty1TDQ12uqAEoVX5jufehNW5z.webp', 'local', 'pagesImage/e76fAiUY6BJorkTxIon6uc7ddr8rJd.webp', 'local', 1, 1, 0, NULL, '2024-06-03 09:06:57', '2024-10-02 12:41:27', 'Launch your global money transfer business with Waiz. Our digital wallet and remittance app provide a seamless, efficient, and secure way to handle financial transactions across borders.', 'index,follow');

-- --------------------------------------------------------

--
-- Table structure for table `page_details`
--

CREATE TABLE `page_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `sections` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_details`
--

INSERT INTO `page_details` (`id`, `page_id`, `language_id`, `name`, `content`, `sections`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Home', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[features]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_work]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[why_choose_us]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[countries]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><p><br></p>', '[\"hero\",\"features\",\"about\",\"how_it_work\",\"why_choose_us\",\"testimonial\",\"faq\",\"blog\",\"news_letter\",\"countries\",\"footer\"]', '2023-11-30 09:30:01', '2024-07-02 13:31:44'),
(2, 2, 1, 'About', '<p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_work]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[why_choose_us]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[features]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><p><br></p>', '[\"about\",\"how_it_work\",\"why_choose_us\",\"features\",\"news_letter\",\"footer\"]', '2023-11-30 09:33:10', '2024-07-02 12:50:28'),
(4, 4, 1, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2023-11-30 09:34:28', '2024-07-02 12:38:23'),
(5, 5, 1, 'Contact', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><p><br></p>', '[\"contact\",\"news_letter\",\"footer\"]', '2023-11-30 09:35:09', '2024-07-02 13:32:32'),
(11, 1, 2, 'Hogar', '<p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[hero]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[features]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[how_it_work]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[why_choose_us]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[blog]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"hero\",\"features\",\"about\",\"how_it_work\",\"why_choose_us\",\"testimonial\",\"blog\",\"news_letter\",\"footer\"]', '2024-02-27 11:36:52', '2024-07-03 04:45:17'),
(12, 2, 2, 'Acerca de', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[about]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[testimonial]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><p><br></p><p><br></p>', '[\"about\",\"testimonial\",\"news_letter\",\"footer\"]', '2024-02-27 11:56:51', '2024-07-02 12:42:12'),
(13, 21, 2, 'Blogs', NULL, NULL, '2024-02-27 12:10:58', '2024-07-02 13:46:38'),
(14, 4, 2, 'Faq', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[faq]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p>', '[\"faq\",\"footer\"]', '2024-02-27 12:32:20', '2024-07-02 13:32:08'),
(15, 5, 2, 'Contacto', '<div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[contact]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[news_letter]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><div class=\"custom-block\" contenteditable=\"false\"><div class=\"custom-block-content\">[[footer]]</div>\r\n                    <span class=\"delete-block\">×</span>\r\n                    <span class=\"up-block\">↑</span>\r\n                    <span class=\"down-block\">↓</span></div><p><br></p><p><br></p>', '[\"contact\",\"news_letter\",\"footer\"]', '2024-02-27 12:34:15', '2024-07-02 13:33:15'),
(16, 25, 2, 'facebook', NULL, NULL, '2024-02-27 12:44:49', '2024-02-27 12:44:49'),
(17, 23, 2, 'Acceso', NULL, NULL, '2024-02-27 12:45:35', '2024-07-02 13:34:40'),
(18, 24, 2, 'Registro', NULL, NULL, '2024-02-27 12:45:46', '2024-07-02 13:35:39'),
(19, 24, 1, 'Register', NULL, NULL, '2024-02-28 05:21:49', '2024-02-28 05:21:49'),
(20, 25, 1, 'Facebook', NULL, NULL, '2024-02-28 07:10:56', '2024-02-28 07:11:14'),
(21, 23, 1, 'Login', NULL, NULL, '2024-02-28 09:33:30', '2024-02-28 09:54:43'),
(22, 21, 1, 'Blogs', NULL, NULL, '2024-02-28 09:34:55', '2024-02-28 09:52:36'),
(23, 26, 1, 'linkedin', NULL, NULL, '2024-02-28 10:07:54', '2024-02-28 10:07:54'),
(24, 27, 1, 'Terms Conditions', '<h5><span>TERMS &amp; CONDITIONS</span></h5>\r\n        <p><br></p>\r\n        <p>These Terms &amp; Conditions (\"Terms\") govern your use of the Waiz platform and services. By accessing or using Waiz, you agree to be bound by these Terms. Please read them carefully before using our services.</p>\r\n        <p><br></p>\r\n        <h6><span>1. Use of Services</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Eligibility:</strong> You must be at least 18 years old and capable of forming a binding contract to use Waiz.</p>\r\n        <p>- <strong>Account:</strong> You agree to provide accurate and complete information when creating an account with Waiz. You are responsible for maintaining the confidentiality of your account credentials.</p>\r\n        <p>- <strong>Prohibited Activities:</strong> You agree not to engage in any unlawful, fraudulent, or unauthorized use of Waiz. This includes but is not limited to violating any laws, regulations, or third-party rights.</p>\r\n        <p><br></p>\r\n        <h6><span>2. Payments and Fees</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Transaction Fees:</strong> Waiz may charge fees for certain transactions. Fees are disclosed to you before you confirm a transaction.</p>\r\n        <p>- <strong>Currency Conversion:</strong> Currency conversion rates may apply to your transactions. Waiz uses real-time exchange rates which may include a markup.</p>\r\n        <p><br></p>\r\n        <h6><span>3. Privacy Policy</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Collection of Information:</strong> Waiz collects and uses personal information as described in our Privacy Policy. By using Waiz, you consent to the collection, use, and sharing of your information as outlined in the Privacy Policy.</p>\r\n        <p><br></p>\r\n        <h6><span>4. Intellectual Property</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Ownership:</strong> The content, logos, trademarks, and other intellectual property on Waiz are owned or licensed by Waiz. You may not use, reproduce, or distribute any content from Waiz without our prior written consent.</p>\r\n        <p><br></p>\r\n        <h6><span>5. Limitation of Liability</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Disclaimer:</strong> Waiz provides its services on an \"as is\" and \"as available\" basis. We do not guarantee the accuracy, completeness, or reliability of our services.</p>\r\n        <p>- <strong>Limitation of Liability:</strong> Waiz is not liable for any indirect, incidental, special, consequential, or punitive damages, including but not limited to lost profits, arising from your use of Waiz.</p>\r\n        <p><br></p>\r\n        <h6><span>6. Governing Law and Dispute Resolution</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Governing Law:</strong> These Terms are governed by the laws.</p>\r\n        <p>- <strong>Dispute Resolution:</strong> Any disputes arising from these Terms will be resolved through arbitration administered by [Arbitration Service] in accordance with its rules.</p>\r\n        <p><br></p>\r\n        <h6><span>7. Changes to Terms</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Modification:</strong> Waiz reserves the right to update or modify these Terms at any time. Changes will be effective immediately upon posting on Waiz.</p>\r\n        <p>- <strong>Notification:</strong> Waiz will notify you of significant changes to these Terms through the platform or via email.</p>\r\n        <p><br></p>\r\n        <h6><span>8. Contact Us</span></h6>\r\n        <p><br></p>\r\n        <p>If you have any questions about these Terms, please contact us .</p>\r\n        <p><br></p>', NULL, '2024-03-19 04:39:53', '2024-07-02 08:21:41'),
(25, 28, 1, 'Privacy Policy', '<p>This Privacy Policy (\"Policy\") explains how Waiz (\"we\", \"us\", or \"our\") collects, uses, discloses, and safeguards your information when you use our platform and services. Please read this Policy carefully to understand our practices regarding your information and how we will treat it.</p><p>\r\n\r\n        </p><h6><span>1. Information Collection</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Personal Information:</strong> We may collect personal information such as your name, email address, phone number, and payment information when you use Waiz.</p>\r\n        <p>- <strong>Usage Data:</strong> We collect information about how you interact with our platform, such as your IP address, device information, and browsing activity.</p>\r\n        <p><br></p>\r\n        <h6><span>2. Use of Information</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Provide Services:</strong> We use your information to provide and personalize our services, process transactions, and communicate with you.</p>\r\n        <p>- <strong>Improve Services:</strong> We analyze usage data to improve our platform, develop new features, and enhance user experience.</p>\r\n        <p><br></p>\r\n        <h6><span>3. Sharing of Information</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Third-Party Service Providers:</strong> We may share your information with third-party service providers who help us operate our platform and deliver services.</p>\r\n        <p>- <strong>Legal Compliance:</strong> We may disclose your information to comply with legal obligations or protect our rights and interests.</p>\r\n        <p><br></p>\r\n        <h6><span>4. Security of Information</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Data Security:</strong> We implement security measures to protect your information against unauthorized access, alteration, or disclosure.</p>\r\n        <p>- <strong>Data Retention:</strong> We retain your information only as long as necessary to fulfill the purposes outlined in this Policy or as required by law.</p>\r\n        <p><br></p>\r\n        <h6><span>5. Your Choices and Rights</span></h6>\r\n        <p><br></p>\r\n        <p>- <strong>Access and Update:</strong> You can access and update your personal information through your account settings on Waiz.</p>\r\n        <p>- <strong>Opt-Out:</strong> You can opt-out of receiving promotional communications from us by following the instructions in the communication.</p>\r\n        <p><br></p>\r\n        <h6><span>6. Contact Us</span></h6>\r\n        <p><br></p>\r\n        <p>If you have any questions about this Privacy Policy or our privacy practices, please contact us.</p>\r\n        <p><br></p>', NULL, '2024-03-19 05:49:42', '2024-07-02 08:26:42'),
(26, 29, 1, 'Cookie Policy', '<h3><br></h3><h3>Cookie Policy For Waiz Services</h3><p>last updated on June 01, 2024<span style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\"></span><br><br></p><p style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\">Welcome\r\n to digiGoods Services. This Privacy Policy outlines our practices \r\nregarding the collection, use, and disclosure of personal information \r\nwhen you use our website and services.</p><p><br></p><h5>Information We Collect</h5><ol><li>When you create an account, we may collect your name, contact information, and address.</li><li>We may collect payment information when you make transactions on our platform.</li><li>Information you provide when contacting customer support or participating in surveys.</li></ol><p><br></p><h5>How We Use Your Information</h5><ul><li>To provide and improve our courier services.</li><li>Process transactions and send order confirmations.</li><li>Communicate with you about your account, updates, and promotions.</li><li>Analyze website usage and improve our services.</li></ul><p><br></p><h5>Information Sharing</h5><ul><li>We do not sell, trade, or rent your personal information to third parties.</li><li>We may share your information with trusted partners for specific purposes, such as delivery and payment processing.</li></ul><p><br></p><h5>Security</h5><ul><li>We implement industry-standard security measures to protect your personal information.</li><li>However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.</li></ul><h5>Your Choices</h5><div class=\"mt-10\" style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\">You\r\n may review, update, or delete your personal information by contacting \r\nus. You can opt-out of receiving marketing communications by following \r\nthe unsubscribe instructions in emails or contacting us directly.</div><h5>Changes to this Privacy Policy</h5><div class=\"mt-10\" style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\">We\r\n may update our Privacy Policy from time to time. We will notify you of \r\nany changes by posting the new Privacy Policy on this page with an \r\nupdated effective date.</div><h5>Contact Us</h5><ul><li>If you have any questions or concerns about this Privacy Policy, please contact us at user@gmail.com</li><li>If you have any questions or concerns about this Privacy Policy, please contact us at admin@gmail.com</li></ul><p><br></p><p><br></p>', NULL, '2024-06-03 09:06:57', '2024-07-02 13:39:47'),
(27, 29, 2, 'Política de cookies', '<div><br></div><div><h3>Cookie Policy For Waiz Services</h3><p>last updated on January 01, 2024<span style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\"></span><br><br></p><p style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\">Welcome to digiGoods Services. This Privacy Policy outlines our practices regarding the collection, use, and disclosure of personal information when you use our website and services.</p><p><br></p><h5>Information We Collect</h5><ol><li>When you create an account, we may collect your name, contact information, and address.</li><li>We may collect payment information when you make transactions on our platform.</li><li>Information you provide when contacting customer support or participating in surveys.</li></ol><p><br></p><h5>How We Use Your Information</h5><ul><li>To provide and improve our courier services.</li><li>Process transactions and send order confirmations.</li><li>Communicate with you about your account, updates, and promotions.</li><li>Analyze website usage and improve our services.</li></ul><p><br></p><h5>Information Sharing</h5><ul><li>We do not sell, trade, or rent your personal information to third parties.</li><li>We may share your information with trusted partners for specific purposes, such as delivery and payment processing.</li></ul><p><br></p><h5>Security</h5><ul><li>We implement industry-standard security measures to protect your personal information.</li><li>However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security.</li></ul><h5>Your Choices</h5><div class=\"mt-10\" style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\">You may review, update, or delete your personal information by contacting us. You can opt-out of receiving marketing communications by following the unsubscribe instructions in emails or contacting us directly.</div><h5>Changes to this Privacy Policy</h5><div class=\"mt-10\" style=\"color:rgb(51,51,51);font-family:Oxanium, sans-serif;font-size:16px;background-color:rgba(94,53,243,0.02);\">We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page with an updated effective date.</div><h5>Contact Us</h5><ul><li>If you have any questions or concerns about this Privacy Policy, please contact us at user@gmail.com</li><li>If you have any questions or concerns about this Privacy Policy, please contact us at admin@gmail.com</li></ul><p><br></p><p><br></p></div>', NULL, '2024-06-03 09:15:45', '2024-07-02 13:39:54'),
(30, 27, 2, 'Términos y condiciones', '<h5>TERMS &amp; CONDITIONS</h5><p><br></p><p>These Terms &amp; Conditions (\"Terms\") govern your use of the Waiz platform and services. By accessing or using Waiz, you agree to be bound by these Terms. Please read them carefully before using our services.</p><p><br></p><h6>1. Use of Services</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Eligibility:</span> You must be at least 18 years old and capable of forming a binding contract to use Waiz.</p><p>- <span style=\"font-weight:bolder;\">Account:</span> You agree to provide accurate and complete information when creating an account with Waiz. You are responsible for maintaining the confidentiality of your account credentials.</p><p>- <span style=\"font-weight:bolder;\">Prohibited Activities:</span> You agree not to engage in any unlawful, fraudulent, or unauthorized use of Waiz. This includes but is not limited to violating any laws, regulations, or third-party rights.</p><p><br></p><h6>2. Payments and Fees</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Transaction Fees:</span> Waiz may charge fees for certain transactions. Fees are disclosed to you before you confirm a transaction.</p><p>- <span style=\"font-weight:bolder;\">Currency Conversion:</span> Currency conversion rates may apply to your transactions. Waiz uses real-time exchange rates which may include a markup.</p><p><br></p><h6>3. Privacy Policy</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Collection of Information:</span> Waiz collects and uses personal information as described in our Privacy Policy. By using Waiz, you consent to the collection, use, and sharing of your information as outlined in the Privacy Policy.</p><p><br></p><h6>4. Intellectual Property</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Ownership:</span> The content, logos, trademarks, and other intellectual property on Waiz are owned or licensed by Waiz. You may not use, reproduce, or distribute any content from Waiz without our prior written consent.</p><p><br></p><h6>5. Limitation of Liability</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Disclaimer:</span> Waiz provides its services on an \"as is\" and \"as available\" basis. We do not guarantee the accuracy, completeness, or reliability of our services.</p><p>- <span style=\"font-weight:bolder;\">Limitation of Liability:</span> Waiz is not liable for any indirect, incidental, special, consequential, or punitive damages, including but not limited to lost profits, arising from your use of Waiz.</p><p><br></p><h6>6. Governing Law and Dispute Resolution</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Governing Law:</span> These Terms are governed by the laws.</p><p>- <span style=\"font-weight:bolder;\">Dispute Resolution:</span> Any disputes arising from these Terms will be resolved through arbitration administered by [Arbitration Service] in accordance with its rules.</p><p><br></p><h6>7. Changes to Terms</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Modification:</span> Waiz reserves the right to update or modify these Terms at any time. Changes will be effective immediately upon posting on Waiz.</p><p>- <span style=\"font-weight:bolder;\">Notification:</span> Waiz will notify you of significant changes to these Terms through the platform or via email.</p><p><br></p><h6>8. Contact Us</h6><p><br></p><p>If you have any questions about these Terms, please contact us .</p><p><br></p>', NULL, '2024-07-02 13:37:34', '2024-07-02 13:37:34'),
(31, 28, 2, 'Política de Privacidad', '<p>This Privacy Policy (\"Policy\") explains how Waiz (\"we\", \"us\", or \"our\") collects, uses, discloses, and safeguards your information when you use our platform and services. Please read this Policy carefully to understand our practices regarding your information and how we will treat it.</p><p></p><h6>1. Information Collection</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Personal Information:</span> We may collect personal information such as your name, email address, phone number, and payment information when you use Waiz.</p><p>- <span style=\"font-weight:bolder;\">Usage Data:</span> We collect information about how you interact with our platform, such as your IP address, device information, and browsing activity.</p><p><br></p><h6>2. Use of Information</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Provide Services:</span> We use your information to provide and personalize our services, process transactions, and communicate with you.</p><p>- <span style=\"font-weight:bolder;\">Improve Services:</span> We analyze usage data to improve our platform, develop new features, and enhance user experience.</p><p><br></p><h6>3. Sharing of Information</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Third-Party Service Providers:</span> We may share your information with third-party service providers who help us operate our platform and deliver services.</p><p>- <span style=\"font-weight:bolder;\">Legal Compliance:</span> We may disclose your information to comply with legal obligations or protect our rights and interests.</p><p><br></p><h6>4. Security of Information</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Data Security:</span> We implement security measures to protect your information against unauthorized access, alteration, or disclosure.</p><p>- <span style=\"font-weight:bolder;\">Data Retention:</span> We retain your information only as long as necessary to fulfill the purposes outlined in this Policy or as required by law.</p><p><br></p><h6>5. Your Choices and Rights</h6><p><br></p><p>- <span style=\"font-weight:bolder;\">Access and Update:</span> You can access and update your personal information through your account settings on Waiz.</p><p>- <span style=\"font-weight:bolder;\">Opt-Out:</span> You can opt-out of receiving promotional communications from us by following the instructions in the communication.</p><p><br></p><h6>6. Contact Us</h6><p><br></p><p>If you have any questions about this Privacy Policy or our privacy practices, please contact us.</p><p><br></p>', NULL, '2024-07-02 13:38:46', '2024-07-02 13:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_contacts`
--

CREATE TABLE `razorpay_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE `recipients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=> myself, 1=>others',
  `r_user_id` int(11) DEFAULT NULL COMMENT 'Recipient User Id',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_info` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '0 =>  Open, 1 => Answered, 2 => Replied, 3 => Closed',
  `last_reply` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_attachments`
--

CREATE TABLE `support_ticket_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_message_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `driver` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `transactional_id` int(11) DEFAULT NULL,
  `transactional_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `wallet_id` int(11) DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL COMMENT 'payment method currency',
  `base_amount` double(11,2) DEFAULT NULL,
  `balance` varchar(20) DEFAULT NULL,
  `charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `trx_type` varchar(10) DEFAULT NULL,
  `remarks` varchar(191) NOT NULL,
  `trx_id` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_settings`
--

CREATE TABLE `two_factor_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `security_pin` varchar(255) DEFAULT NULL,
  `enable_for` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `referral_id` int(11) DEFAULT NULL,
  `refer_bonus` tinyint(1) DEFAULT 0,
  `language_id` int(11) DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `phone_code` varchar(20) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_driver` varchar(50) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL COMMENT 'Zip Or Postal Code',
  `address_one` text DEFAULT NULL,
  `address_two` text DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `two_fa` tinyint(1) NOT NULL DEFAULT 0,
  `two_fa_verify` tinyint(1) NOT NULL DEFAULT 1,
  `two_fa_code` varchar(50) DEFAULT NULL,
  `email_verification` tinyint(1) DEFAULT 0,
  `sms_verification` tinyint(1) NOT NULL DEFAULT 1,
  `verify_code` varchar(50) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `time_zone` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_kycs`
--

CREATE TABLE `user_kycs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kyc_id` int(11) DEFAULT NULL,
  `kyc_type` varchar(191) DEFAULT NULL,
  `kyc_info` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending , 1=> verified, 2=>rejected',
  `reason` longtext DEFAULT NULL COMMENT 'rejected reason',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `country_code` varchar(50) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `browser` varchar(191) DEFAULT NULL,
  `os` varchar(191) DEFAULT NULL,
  `get_device` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_wallets`
--

CREATE TABLE `user_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `balance` decimal(16,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = active, 0 = inactive',
  `default` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 = Yes, 0 = No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_card_methods`
--

CREATE TABLE `virtual_card_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `image_driver` varchar(255) DEFAULT 'local',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL,
  `currencies` text DEFAULT NULL,
  `debit_currency` varchar(20) DEFAULT NULL,
  `extra_parameters` text DEFAULT NULL,
  `add_fund_parameter` text DEFAULT NULL,
  `form_field` text DEFAULT NULL,
  `currency` text DEFAULT NULL,
  `symbol` text DEFAULT NULL,
  `info_box` mediumtext DEFAULT NULL,
  `alert_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `virtual_card_methods`
--

INSERT INTO `virtual_card_methods` (`id`, `code`, `name`, `image`, `image_driver`, `status`, `parameters`, `currencies`, `debit_currency`, `extra_parameters`, `add_fund_parameter`, `form_field`, `currency`, `symbol`, `info_box`, `alert_message`, `created_at`, `updated_at`) VALUES
(1, 'flutterwave', 'Flutterwave', 'virtualCardMethod/2rvEvKs62ar2xPYsV6LZJUQn8vvTyf.avif', 'local', 0, '{\"public_key\":\"FLWPUBK_TEST-5003321b93b251536fd2e7e05232004f-X\",\"secret_key\":\"FLWSECK_TEST-d604361e2d4962f4bb2a400c5afefab1-X\",\"encryption_key\":\"FLWSECK_TEST817a365e142b\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\"}}', 'NGN', NULL, '{\"NGN\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"500\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"10000\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"2.3\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"15\",\"type\":\"text\",\"validation\":\"required\"}},\"USD\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"5\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"500\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"1\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"5\",\"type\":\"text\",\"validation\":\"required\"}}}', '{\"FirstName\":{\"field_name\":\"FirstName\",\"field_level\":\"First Name\",\"field_place\":\"Example\",\"type\":\"text\",\"validation\":\"required\"},\"LastName\":{\"field_name\":\"LastName\",\"field_level\":\"Last Name\",\"field_place\":\"User\",\"type\":\"text\",\"validation\":\"required\"},\"DateOfBirth\":{\"field_name\":\"DateOfBirth\",\"field_level\":\"Date Of Birth\",\"field_place\":\"1996/12/30\",\"type\":\"date\",\"validation\":\"required\"},\"Email\":{\"field_name\":\"Email\",\"field_level\":\"Email\",\"field_place\":\"userg@example.com\",\"type\":\"text\",\"validation\":\"required\"},\"Phone\":{\"field_name\":\"Phone\",\"field_level\":\"Phone\",\"field_place\":\"07030000000\",\"type\":\"text\",\"validation\":\"required\"},\"Title\":{\"field_name\":\"Title\",\"field_level\":\"Title\",\"field_place\":\"MR\",\"type\":\"text\",\"validation\":\"required\"},\"Gender\":{\"field_name\":\"Gender\",\"field_level\":\"Gender\",\"field_place\":\"M\",\"type\":\"text\",\"validation\":\"required\"},\"BillingName\":{\"field_name\":\"BillingName\",\"field_level\":\"Billing Name\",\"field_place\":\"Example User.\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingAddress\":{\"field_name\":\"BillingAddress\",\"field_level\":\"Billing Address\",\"field_place\":\"333, Fremont Street\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingCity\":{\"field_name\":\"BillingCity\",\"field_level\":\"Billing City\",\"field_place\":\"San Francisco\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingState\":{\"field_name\":\"BillingState\",\"field_level\":\"Billing State\",\"field_place\":\"CA\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingCountry\":{\"field_name\":\"BillingCountry\",\"field_level\":\"Billing Country\",\"field_place\":\"US\",\"type\":\"text\",\"validation\":\"nullable\"},\"BillingPostalCode\":{\"field_name\":\"BillingPostalCode\",\"field_level\":\"Billing Postal Code\",\"field_place\":\"94105\",\"type\":\"text\",\"validation\":\"nullable\"}}', '[\"NGN\",\"USD\"]', '[\"₦\",\"$\"]', '<p>The Flutterwave API allows you to create virtual card</p><p><br></p>', NULL, '2023-01-15 05:30:44', '2024-03-25 04:23:11'),
(2, 'ufitpay', 'UfitPay', 'virtualCardMethod/BsH9rIkmMHUxvdZ5jd7PTutbrPGlno.avif', 'local', 0, '{\"Api_Key\":\"B4TXceFWJ3wvo8jM0Iu1JEI5BX5z\",\"Api_Token\":\"AAwKUOwwykMZGXvQWvBO83r0Jqcz\"}', '{\"0\":{\"NGN\":\"NGN\",\"USD\":\"USD\"}}', 'USD', NULL, '{\"NGN\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"2500\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"25000\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"4\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"15\",\"type\":\"text\",\"validation\":\"required\"}},\"USD\":{\"MinimumAmount\":{\"field_name\":\"MinimumAmount\",\"field_level\":\"Minimum Amount\",\"field_value\":\"10\",\"type\":\"text\",\"validation\":\"required\"},\"MaximumAmount\":{\"field_name\":\"MaximumAmount\",\"field_level\":\"Maximum Amount\",\"field_value\":\"500\",\"type\":\"text\",\"validation\":\"required\"},\"PercentCharge\":{\"field_name\":\"PercentCharge\",\"field_level\":\"Percent Charge\",\"field_value\":\"1\",\"type\":\"text\",\"validation\":\"required\"},\"FixedCharge\":{\"field_name\":\"FixedCharge\",\"field_level\":\"Fixed Charge\",\"field_value\":\"2\",\"type\":\"text\",\"validation\":\"required\"},\"OpeningAmount\":{\"field_name\":\"OpeningAmount\",\"field_level\":\"Opening Amount\",\"field_value\":\"3000\",\"type\":\"text\",\"validation\":\"required\"}}}', '{\"FirstName\":{\"field_name\":\"FirstName\",\"field_level\":\"First Name\",\"field_place\":\"Alex\",\"type\":\"text\",\"validation\":\"required\"},\"LastName\":{\"field_name\":\"LastName\",\"field_level\":\"Last Name\",\"field_place\":\"Hels\",\"type\":\"text\",\"validation\":\"required\"},\"Email\":{\"field_name\":\"Email\",\"field_level\":\"Email\",\"field_place\":\"alexhels@gmail.com\",\"type\":\"text\",\"validation\":\"required\"},\"Phone\":{\"field_name\":\"Phone\",\"field_level\":\"Phone\",\"field_place\":\"965852369\",\"type\":\"text\",\"validation\":\"required\"},\"BVN\":{\"field_name\":\"BVN\",\"field_level\":\"BVM\",\"field_place\":\"22485231397\",\"type\":\"text\",\"validation\":\"nullable\"}}', '[\"NGN\",\"USD\"]', '[\"₦\",\"$\"]', 'The UfitPay API allows you to create virtual card...', NULL, '2023-01-15 05:30:44', '2024-03-25 04:23:11'),
(3, 'stripe', 'Stripe', 'virtualCardMethod/rpsgi2b8Kq0WexSrBpOdpTbnJyXGjj.webp', 'local', 0, '{\"secret_key\":\"sk_test_51OLg62Cmxe5i1RDb2m9UJuIq89UGccR6wK5NVFmpY6NyK24ohjaDQ2wDf2QwDIlNskkmWJVv2lx6eL50xvocdf3700R8VT3350\",\"public_key\":\"pk_test_51OLg62Cmxe5i1RDbEN2tWaRKJmMfFYzu13vQwFzZrWmJoNoHqiQtZXFljhuKcMoD9sB5yAbLvl6lLMKT9IlvEKc0008MKxHqnD\"}', '{\"0\":{\"USD\":\"USD\"}}', 'USD', NULL, '{\r\n        \"USD\": {\r\n            \"MinimumAmount\": {\"field_name\": \"MinimumAmount\", \"field_level\": \"Minimum Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"MaximumAmount\": {\"field_name\": \"MaximumAmount\", \"field_level\": \"Maximum Amount\", \"field_value\": \"5000\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"PercentCharge\": {\"field_name\": \"PercentCharge\", \"field_level\": \"Percent Charge\", \"field_value\": \"2.5\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"FixedCharge\": {\"field_name\": \"FixedCharge\", \"field_level\": \"Fixed Charge\", \"field_value\": \"1\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"OpeningAmount\": {\"field_name\": \"OpeningAmount\", \"field_level\": \"Opening Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"}\r\n        }\r\n    }', '{\n        \"FirstName\": {\"field_name\": \"FirstName\", \"field_level\": \"First Name\", \"field_place\": \"John\", \"type\": \"text\", \"validation\": \"required\"},\n        \"LastName\": {\"field_name\": \"LastName\", \"field_level\": \"Last Name\", \"field_place\": \"Doe\", \"type\": \"text\", \"validation\": \"required\"},\n        \"DateOfBirth\": {\"field_name\": \"DateOfBirth\", \"field_level\": \"Date Of Birth\", \"field_place\": \"1990/01/01\", \"type\": \"date\", \"validation\": \"required\"},\n        \"Email\": {\"field_name\": \"Email\", \"field_level\": \"Email\", \"field_place\": \"john.doe@example.com\", \"type\": \"email\", \"validation\": \"required\"},\n        \"Phone\": {\"field_name\": \"Phone\", \"field_level\": \"Phone\", \"field_place\": \"+1234567890\", \"type\": \"text\", \"validation\": \"required\"},\n        \"BillingName\": {\"field_name\": \"BillingName\", \"field_level\": \"Billing Name\", \"field_place\": \"John Doe\", \"type\": \"text\", \"validation\": \"required\"},\n        \"BillingAddress\": {\"field_name\": \"BillingAddress\", \"field_level\": \"Billing Address\", \"field_place\": \"123 Main Street\", \"type\": \"text\", \"validation\": \"required\"},\n        \"BillingCity\": {\"field_name\": \"BillingCity\", \"field_level\": \"Billing City\", \"field_place\": \"San Francisco\", \"type\": \"text\", \"validation\": \"required\"},\n        \"BillingState\": {\"field_name\": \"BillingState\", \"field_level\": \"Billing State\", \"field_place\": \"CA\", \"type\": \"text\", \"validation\": \"required\"},\n        \"BillingCountry\": {\"field_name\": \"BillingCountry\", \"field_level\": \"Billing Country\", \"field_place\": \"US\", \"type\": \"text\", \"validation\": \"required\"},\n        \"BillingPostalCode\": {\"field_name\": \"BillingPostalCode\", \"field_level\": \"Billing Postal Code\", \"field_place\": \"94105\", \"type\": \"text\", \"validation\": \"required\"}\n    }', '[\"USD\"]', '[\"$\"]', 'The Stripe API allows you to create virtual cards...\r\nPlease give valid data for request virtual card.', NULL, '2024-08-12 07:14:22', '2024-10-08 07:13:46'),
(4, 'marqeta', 'Marqeta', 'virtualCardMethod/77ibkyyzVj6tiih3RgYUSN9TbZSF9y.webp', 'local', 0, '{\"secret_key\":\"7f1c3842-af7d-46e3-9519-881341bd5848\",\"public_key\":\"4ad2fd89-c23e-4cc7-b466-f2e2e706643f\"}', '{\"0\":{\"USD\":\"USD\"}}', 'USD', NULL, '{\r\n        \"USD\": {\r\n            \"MinimumAmount\": {\"field_name\": \"MinimumAmount\", \"field_level\": \"Minimum Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"MaximumAmount\": {\"field_name\": \"MaximumAmount\", \"field_level\": \"Maximum Amount\", \"field_value\": \"5000\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"PercentCharge\": {\"field_name\": \"PercentCharge\", \"field_level\": \"Percent Charge\", \"field_value\": \"2.5\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"FixedCharge\": {\"field_name\": \"FixedCharge\", \"field_level\": \"Fixed Charge\", \"field_value\": \"1\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"OpeningAmount\": {\"field_name\": \"OpeningAmount\", \"field_level\": \"Opening Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"}\r\n        }\r\n    }', '{\n                \"FirstName\": {\n                    \"field_name\": \"FirstName\",\n                    \"field_level\": \"First Name\",\n                    \"field_place\": \"John\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"LastName\": {\n                    \"field_name\": \"LastName\",\n                    \"field_level\": \"Last Name\",\n                    \"field_place\": \"Doe\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"CustomerEmail\": {\n                    \"field_name\": \"CustomerEmail\",\n                    \"field_level\": \"Email\",\n                    \"field_place\": \"john.doe@bug2.com\",\n                    \"type\": \"email\",\n                    \"validation\": \"required\"\n                },\n                \"PhoneNumber\": {\n                    \"field_name\": \"PhoneNumber\",\n                    \"field_level\": \"Phone Number\",\n                    \"field_place\": \"+14155551234\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"Line1\": {\n                    \"field_name\": \"Line1\",\n                    \"field_level\": \"Address Line 1\",\n                    \"field_place\": \"123 Main St.\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"Line2\": {\n                    \"field_name\": \"Line2\",\n                    \"field_level\": \"Address Line 2\",\n                    \"field_place\": \"123 Main St.\",\n                    \"type\": \"text\",\n                    \"validation\": \"\"\n                },\n                \"City\": {\n                    \"field_name\": \"City\",\n                    \"field_level\": \"City\",\n                    \"field_place\": \"San Francisco\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"State\": {\n                    \"field_name\": \"State\",\n                    \"field_level\": \"State\",\n                    \"field_place\": \"CA\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"Country\": {\n                    \"field_name\": \"Country\",\n                    \"field_level\": \"Country\",\n                    \"field_place\": \"USA\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"PostalCode\": {\n                    \"field_name\": \"PostalCode\",\n                    \"field_level\": \"Postal Code\",\n                    \"field_place\": \"\",\n                    \"type\": \"text\",\n                    \"validation\": \"\"\n                },\n                \"DateOfBirth\": {\n                    \"field_name\": \"DateOfBirth\",\n                    \"field_level\": \"Date Of Birth\",\n                    \"field_place\": \"1995-05-15\",\n                    \"type\": \"date\",\n                    \"validation\": \"\"\n                }\n            }', '[\"USD\"]', '[\"$\"]', 'The Marqeta API allows you to create virtual cards...\r\nPlease give valid data for request virtual card.', NULL, '2024-08-12 07:14:22', '2024-10-09 12:34:35'),
(5, 'rapyd', 'Rapyd', 'virtualCardMethod/LCmD5BDdFdTGHndBhSc0tyDSmu6c4z.webp', 'local', 0, '{\"secret_key\":\"rsk_fb9f5d5daf7f1ce2a144f9610e0b2351a5c4f8f3c545ae0e499692b22f36144d2015bf76c94ef9db\",\"public_key\":\"rak_B34E5A296008222420F4\"}', '{\"0\":{\"USD\":\"USD\"}}', 'USD', NULL, '{\r\n        \"USD\": {\r\n            \"MinimumAmount\": {\"field_name\": \"MinimumAmount\", \"field_level\": \"Minimum Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"MaximumAmount\": {\"field_name\": \"MaximumAmount\", \"field_level\": \"Maximum Amount\", \"field_value\": \"5000\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"PercentCharge\": {\"field_name\": \"PercentCharge\", \"field_level\": \"Percent Charge\", \"field_value\": \"2.5\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"FixedCharge\": {\"field_name\": \"FixedCharge\", \"field_level\": \"Fixed Charge\", \"field_value\": \"1\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"OpeningAmount\": {\"field_name\": \"OpeningAmount\", \"field_level\": \"Opening Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"}\r\n        }\r\n    }', '{\n                \"FirstName\": {\n                    \"field_name\": \"FirstName\",\n                    \"field_level\": \"First Name\",\n                    \"field_place\": \"John\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"LastName\": {\n                    \"field_name\": \"LastName\",\n                    \"field_level\": \"Last Name\",\n                    \"field_place\": \"Doe\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"CustomerEmail\": {\n                    \"field_name\": \"CustomerEmail\",\n                    \"field_level\": \"Email\",\n                    \"field_place\": \"john.doe@bug2.com\",\n                    \"type\": \"email\",\n                    \"validation\": \"required\"\n                },\n                \"PhoneNumber\": {\n                    \"field_name\": \"PhoneNumber\",\n                    \"field_level\": \"Phone Number\",\n                    \"field_place\": \"+14155551234\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"Line1\": {\n                    \"field_name\": \"Line1\",\n                    \"field_level\": \"Address Line 1\",\n                    \"field_place\": \"123 Main St.\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"Line2\": {\n                    \"field_name\": \"Line2\",\n                    \"field_level\": \"Address Line 2\",\n                    \"field_place\": \"123 Main St.\",\n                    \"type\": \"text\",\n                    \"validation\": \"\"\n                },\n                \"City\": {\n                    \"field_name\": \"City\",\n                    \"field_level\": \"City\",\n                    \"field_place\": \"San Francisco\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"State\": {\n                    \"field_name\": \"State\",\n                    \"field_level\": \"State\",\n                    \"field_place\": \"CA\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"Country\": {\n                    \"field_name\": \"Country\",\n                    \"field_level\": \"Country\",\n                    \"field_place\": \"USA\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"PostalCode\": {\n                    \"field_name\": \"PostalCode\",\n                    \"field_level\": \"Postal Code\",\n                    \"field_place\": \"\",\n                    \"type\": \"text\",\n                    \"validation\": \"required\"\n                },\n                \"DateOfBirth\": {\n                    \"field_name\": \"DateOfBirth\",\n                    \"field_level\": \"Date Of Birth\",\n                    \"field_place\": \"1995-05-15\",\n                    \"type\": \"date\",\n                    \"validation\": \"required\"\n                },\n                \"PassportId\": {\n                    \"field_name\": \"PassportId\",\n                    \"field_level\": \"Passport Id\",\n                    \"field_place\": \"1234567898\",\n                    \"type\": \"number\",\n                    \"validation\": \"required\"\n                }\n            }', '[\"USD\"]', '[\"$\"]', 'The Rapyd API allows you to create virtual cards...\r\nPlease give valid data for request virtual card.', NULL, '2024-08-12 07:14:22', '2024-10-09 12:34:21'),
(6, 'strowallet', 'Strowallet', 'virtualCardMethod/vqhoUy5aNDs7dG3qWfjbUhlcvKkAb0.webp', 'local', 1, '{\"secret_key\":\"BD79Y6XYX122E64QO781JMM5UKZJ92\",\"public_key\":\"4O8OTHT7WX6BS4RBVQWJ98BQ6VBW22\"}', '{\"0\":{\"USD\":\"USD\"}}', 'USD', NULL, '{\r\n        \"USD\": {\r\n            \"MinimumAmount\": {\"field_name\": \"MinimumAmount\", \"field_level\": \"Minimum Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"MaximumAmount\": {\"field_name\": \"MaximumAmount\", \"field_level\": \"Maximum Amount\", \"field_value\": \"5000\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"PercentCharge\": {\"field_name\": \"PercentCharge\", \"field_level\": \"Percent Charge\", \"field_value\": \"2.5\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"FixedCharge\": {\"field_name\": \"FixedCharge\", \"field_level\": \"Fixed Charge\", \"field_value\": \"1\", \"type\": \"text\", \"validation\": \"required\"},\r\n            \"OpeningAmount\": {\"field_name\": \"OpeningAmount\", \"field_level\": \"Opening Amount\", \"field_value\": \"10\", \"type\": \"text\", \"validation\": \"required\"}\r\n        }\r\n    }', '{\n            \"FirstName\": {\n                \"field_name\": \"FirstName\",\n                \"field_level\": \"First Name\",\n                \"field_place\": \"John\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"LastName\": {\n                \"field_name\": \"LastName\",\n                \"field_level\": \"Last Name\",\n                \"field_place\": \"Doe\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"CustomerEmail\": {\n                \"field_name\": \"CustomerEmail\",\n                \"field_level\": \"Email\",\n                \"field_place\": \"john.doe@example.com\",\n                \"type\": \"email\",\n                \"validation\": \"required\"\n            },\n            \"PhoneNumber\": {\n                \"field_name\": \"PhoneNumber\",\n                \"field_level\": \"Phone Number\",\n                \"field_place\": \"1234567890\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"DateOfBirth\": {\n                \"field_name\": \"DateOfBirth\",\n                \"field_level\": \"Date Of Birth\",\n                \"field_place\": \"mm/dd/yyyy\",\n                \"type\": \"date\",\n                \"validation\": \"required\"\n            },\n            \"IdImage\": {\n                \"field_name\": \"IdImage\",\n                \"field_level\": \"ID Card Image URL\",\n                \"field_place\": \"http://example.com/idcard.jpg\",\n                \"type\": \"url\",\n                \"validation\": \"required\"\n            },\n            \"UserPhoto\": {\n                \"field_name\": \"UserPhoto\",\n                \"field_level\": \"User Photo URL\",\n                \"field_place\": \"http://example.com/photo.jpg\",\n                \"type\": \"url\",\n                \"validation\": \"required\"\n            },\n            \"HouseNumber\": {\n                \"field_name\": \"HouseNumber\",\n                \"field_level\": \"House Number\",\n                \"field_place\": \"10A\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"Line1\": {\n                \"field_name\": \"Line1\",\n                \"field_level\": \"Address Line 1\",\n                \"field_place\": \"Nii Kwabena Bonnie Crescent\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"City\": {\n                \"field_name\": \"City\",\n                \"field_level\": \"City\",\n                \"field_place\": \"Accra\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"State\": {\n                \"field_name\": \"State\",\n                \"field_level\": \"State\",\n                \"field_place\": \"Accra\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"Country\": {\n                \"field_name\": \"Country\",\n                \"field_level\": \"Country\",\n                \"field_place\": \"Ghana\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"ZipCode\": {\n                \"field_name\": \"ZipCode\",\n                \"field_level\": \"Zip Code\",\n                \"field_place\": \"94105\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"IdType\": {\n                \"field_name\": \"IdType\",\n                \"field_level\": \"ID Type\",\n                \"field_place\": \"PASSPORT,BVN,NIN\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            },\n            \"IdNumber\": {\n                \"field_name\": \"IdNumber\",\n                \"field_level\": \"ID Number\",\n                \"field_place\": \"123456789\",\n                \"type\": \"text\",\n                \"validation\": \"required\"\n            }\n        }', '[\"USD\"]', '[\"$\"]', 'The Strowallet API allows you to create virtual cards...\r\nPlease give valid data for request virtual card.', NULL, '2024-08-12 07:14:22', '2024-10-10 04:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `virtual_card_orders`
--

CREATE TABLE `virtual_card_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `virtual_card_method_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `currency` varchar(255) NOT NULL,
  `form_input` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>pending,1=>approve,2=>rejected,3=>resubmit,4=>generate,5=>block rqst,6=>fund rejected,7=>block,8=>add_fund_rqst,9=>inactive',
  `fund_amount` double NOT NULL DEFAULT 0,
  `fund_charge` double NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `resubmitted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=>no,1=>yes',
  `charge` double NOT NULL DEFAULT 0 COMMENT 'admin charge',
  `charge_currency` varchar(255) DEFAULT NULL COMMENT 'admin base currency',
  `card_info` text DEFAULT NULL COMMENT 'response card information',
  `balance` double NOT NULL DEFAULT 0,
  `cvv` varchar(255) DEFAULT NULL,
  `card_number` text DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `name_on_card` varchar(255) DEFAULT NULL,
  `card_Id` varchar(255) DEFAULT NULL,
  `last_error` text DEFAULT NULL COMMENT 'api given last error',
  `test` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `virtual_card_transactions`
--

CREATE TABLE `virtual_card_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `card_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `card_id` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trx_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `basic_controls`
--
ALTER TABLE `basic_controls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_name_unique` (`name`);

--
-- Indexes for table `blog_details`
--
ALTER TABLE `blog_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_details`
--
ALTER TABLE `content_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_banks`
--
ALTER TABLE `country_banks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banks_country_id_foreign` (`country_id`);

--
-- Indexes for table `country_cities`
--
ALTER TABLE `country_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_currency`
--
ALTER TABLE `country_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_services`
--
ALTER TABLE `country_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposits_user_id_foreign` (`user_id`),
  ADD KEY `deposits_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_storages`
--
ALTER TABLE `file_storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gateways_code_unique` (`code`);

--
-- Indexes for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `kycs`
--
ALTER TABLE `kycs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_menus`
--
ALTER TABLE `manage_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_requests`
--
ALTER TABLE `money_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `notification_permissions`
--
ALTER TABLE `notification_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_templates_language_id_foreign` (`language_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_details`
--
ALTER TABLE `page_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recipients_uuid_unique` (`uuid`),
  ADD KEY `recipients_user_id_foreign` (`user_id`),
  ADD KEY `recipients_currency_id_foreign` (`currency_id`),
  ADD KEY `recipients_service_id_foreign` (`service_id`),
  ADD KEY `recipients_bank_id_foreign` (`bank_id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `two_factor_settings`
--
ALTER TABLE `two_factor_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `two_factor_settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_kycs`
--
ALTER TABLE `user_kycs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_kycs_user_id_index` (`user_id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_wallets_uuid_unique` (`uuid`),
  ADD KEY `user_wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `virtual_card_methods`
--
ALTER TABLE `virtual_card_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_methods_code_index` (`code`);

--
-- Indexes for table `virtual_card_orders`
--
ALTER TABLE `virtual_card_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_orders_virtual_card_method_id_foreign` (`virtual_card_method_id`),
  ADD KEY `virtual_card_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `virtual_card_transactions_user_id_foreign` (`user_id`),
  ADD KEY `virtual_card_transactions_card_order_id_foreign` (`card_order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `basic_controls`
--
ALTER TABLE `basic_controls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_details`
--
ALTER TABLE `blog_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `content_details`
--
ALTER TABLE `content_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_banks`
--
ALTER TABLE `country_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_cities`
--
ALTER TABLE `country_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_currency`
--
ALTER TABLE `country_currency`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_services`
--
ALTER TABLE `country_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storages`
--
ALTER TABLE `file_storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fire_base_tokens`
--
ALTER TABLE `fire_base_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `in_app_notifications`
--
ALTER TABLE `in_app_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kycs`
--
ALTER TABLE `kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `maintenance_modes`
--
ALTER TABLE `maintenance_modes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manage_menus`
--
ALTER TABLE `manage_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `manual_sms_configs`
--
ALTER TABLE `manual_sms_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `money_requests`
--
ALTER TABLE `money_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_permissions`
--
ALTER TABLE `notification_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `page_details`
--
ALTER TABLE `page_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_contacts`
--
ALTER TABLE `razorpay_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipients`
--
ALTER TABLE `recipients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_attachments`
--
ALTER TABLE `support_ticket_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `two_factor_settings`
--
ALTER TABLE `two_factor_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_kycs`
--
ALTER TABLE `user_kycs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_wallets`
--
ALTER TABLE `user_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_card_methods`
--
ALTER TABLE `virtual_card_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `virtual_card_orders`
--
ALTER TABLE `virtual_card_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `country_banks`
--
ALTER TABLE `country_banks`
  ADD CONSTRAINT `banks_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Constraints for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD CONSTRAINT `notification_templates_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipients`
--
ALTER TABLE `recipients`
  ADD CONSTRAINT `recipients_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `country_banks` (`id`),
  ADD CONSTRAINT `recipients_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `country_currency` (`id`),
  ADD CONSTRAINT `recipients_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `country_services` (`id`),
  ADD CONSTRAINT `recipients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `two_factor_settings`
--
ALTER TABLE `two_factor_settings`
  ADD CONSTRAINT `two_factor_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_wallets`
--
ALTER TABLE `user_wallets`
  ADD CONSTRAINT `user_wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `virtual_card_orders`
--
ALTER TABLE `virtual_card_orders`
  ADD CONSTRAINT `virtual_card_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `virtual_card_orders_virtual_card_method_id_foreign` FOREIGN KEY (`virtual_card_method_id`) REFERENCES `virtual_card_methods` (`id`);

--
-- Constraints for table `virtual_card_transactions`
--
ALTER TABLE `virtual_card_transactions`
  ADD CONSTRAINT `virtual_card_transactions_card_order_id_foreign` FOREIGN KEY (`card_order_id`) REFERENCES `virtual_card_orders` (`id`),
  ADD CONSTRAINT `virtual_card_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
