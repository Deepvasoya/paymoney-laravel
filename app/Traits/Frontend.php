<?php
namespace App\Traits;

use App\Models\Blog;
use App\Models\ContentDetails;
use App\Models\Country;

trait Frontend
{
    protected function getSectionsData($sections, $content, $selectedTheme)
    {
        if ($sections == null) {
            $data = ['support' => $content,];
            return view("themes.$selectedTheme.support", $data)->toHtml();
        }
        $contentData = ContentDetails::with('content')
            ->whereHas('content', function ($query) use ($sections) {
                $query->whereIn('name', $sections);
            })
            ->get();

        foreach ($sections as $section) {
            $singleContent = $contentData->where('content.name', $section)->where('content.type', 'single')->first() ?? [];
            if ($section == 'blog') {
                $data[$section] = [
                    'single' => $singleContent ? collect($singleContent->description ?? [])->merge($singleContent->content->only('media')) : [],
                    'multiple' => Blog::with('details')->where('status',1)->latest()->get()
                ];
            }
            elseif ($section == 'countries') {
                $data[$section] = [
                    'single' => $singleContent ? collect($singleContent->description ?? [])->merge($singleContent->content->only('media')) : [],
                    'multiple' => Country::query()
                        ->with('currency')
                        ->where('status', 1)
                        ->where('receive_from',1)
                        ->get()
                ];
            }
            else {
                $multipleContents = $contentData->where('content.name', $section)->where('content.type', 'multiple')->values()->map(function ($multipleContentData) {
                    return collect($multipleContentData->description)->merge($multipleContentData->content->only('media'));
                });

                $data[$section] = [
                    'single' => $singleContent ? collect($singleContent->description ?? [])->merge($singleContent->content->only('media')) : [],
                    'multiple' => $multipleContents
                ];
            }

            $replacement = view("themes.light.sections.{$section}", $data)->toHtml();

            $content = str_replace('<div class="custom-block" contenteditable="false"><div class="custom-block-content">[[' . $section . ']]</div>', $replacement, $content);
            $content = str_replace('<span class="delete-block">×</span>', '', $content);
            $content = str_replace('<span class="up-block">↑</span>', '', $content);
            $content = str_replace('<span class="down-block">↓</span></div>', '', $content);
            $content = str_replace('<p><br></p>', '', $content);
        }

        return $content;
    }

    protected function handleDatabaseException(\Exception $exception)
    {
        switch ($exception->getCode()) {
            case 404:
                abort(404);
            case 403:
                abort(403);
            case 401:
                abort(401);
            case 503:
                redirect()->route('maintenance')->send();
                break;
            case "42S02":
                die($exception->getMessage());
            case 1045:
                die("Access denied. Please check your username and password.");
            case 1044:
                die("Access denied to the database. Ensure your user has the necessary permissions.");
            case 1049:
                die("Unknown database. Please verify the database name exists and is spelled correctly.");
            case 2002:
                die("Unable to connect to the MySQL server. Check the database host and ensure the server is running.");
            case 0:
                die("Unknown connection issue. Verify your connection parameters and server status.");
            default:
                redirect()->route('instructionPage')->send();
        }
    }

}
