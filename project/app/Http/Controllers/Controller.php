<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class Controller extends BaseController
{
    protected $language;
    protected $languages;
    public function __construct()
    {
        $this->middleware(function ($request, $next) {

            // Set Global Language

            if (Session::has('language')) 
            {
                $this->language = DB::table('languages')->find(Session::get('language'));
            }
            else
            {
                $this->language = DB::table('languages')->where('is_default','=',1)->first();
            } 
           
            App::setlocale(explode('.',$this->language->file)[0]);
            $data_results = file_get_contents(resource_path().'/lang/'.$this->language->file);
            $this->languages = json_decode($data_results);
            return $next($request);
        });
    }

    public function to_cyrillic($string)
    {
        $gost = [
            'zenski'=>'женски',
            'j'=>'Ј',
            "a" => "а", "b" => "б", "v" => "в", "g" => "г", "d" => "д", "e" => "е", "yo" => "ё",
            'i'=>'и',"ii" => "и", "ji" => "й", "k" => "к",
            "l" => "л", "m" => "м", "n" => "н", "o" => "о", "p" => "п", "r" => "р", "s" => "ш", "t" => "т",
            "y" => "у", "f" => "ф", "h" => "х", "c" => "ц",
            "ch" => "ч", "sh" => "ш", "sch" => "щ", "ie" => "ы", "u" => "у", "ya" => "я", "A" => "А", "B" => "Б",
            "V" => "В", "G" => "Г", "D" => "Д", "E" => "Е", "Yo" => "Ё", "J" => "Ж", "Z" => "З", "I" => "И", "Ji" => "Й",
            "K" => "К", "L" => "Л", "M" => "М",
            "N" => "Н", "O" => "О", "P" => "П",
            "R" => "Р", "S" => "С", "T" => "Т", "Y" => "Ю", "F" => "Ф", "H" => "Х", "C" => "Ц", "Ch" => "Ч", "Sh" => "Ш",
            "Sch" => "Щ", "Ie" => "Ы", "U" => "У", "Ya" => "Я", "'" => "ь", "_'" => "Ь", "''" => "ъ", "_''" => "Ъ",
            "yi" => "ї", "ge" => "ґ",
            "ye" => "є",
            "Yi" => "Ї",
            "II" => "І",
            "Ge" => "Ґ",
            "YE" => "Є",
            "nj"=>'њ',
            "gj"=>'ѓ',
            "dz"=>'џ',
            "dj"=>'џ',
            "c"=>'ч',
            "ch"=>'ч',
            "ch"=>'ч',
            "zh"=>'ж',
            "z"=>'ж',
        ];
        return strtr($string, $gost);
    }
    public function to_cyrillic2($string)
    {
        $gost = [
            'zenski'=>'женски',
            'sk'=>'ск',
            'j'=>'Ј',
            "a" => "а", "b" => "б", "v" => "в", "g" => "г", "d" => "д", "e" => "е", "yo" => "ё",
            'i'=>'и',"ii" => "и", "ji" => "й", "k" => "к",
            "l" => "л", "m" => "м", "n" => "н", "o" => "о", "p" => "п", "r" => "р", "s" => "с", "t" => "т",
            "y" => "у", "f" => "ф", "h" => "х", "c" => "ц",
            "ch" => "ч", "sh" => "ш", "sch" => "щ", "ie" => "ы", "u" => "у", "ya" => "я", "A" => "А", "B" => "Б",
            "V" => "В", "G" => "Г", "D" => "Д", "E" => "Е", "Yo" => "Ё", "J" => "Ж", "Z" => "З", "I" => "И", "Ji" => "Й",
            "K" => "К", "L" => "Л", "M" => "М",
            "N" => "Н", "O" => "О", "P" => "П",
            "R" => "Р", "S" => "С", "T" => "Т", "Y" => "Ю", "F" => "Ф", "H" => "Х", "C" => "Ц", "Ch" => "Ч", "Sh" => "Ш",
            "Sch" => "Щ", "Ie" => "Ы", "U" => "У", "Ya" => "Я", "'" => "ь", "_'" => "Ь", "''" => "ъ", "_''" => "Ъ",
            "yi" => "ї", "ge" => "ґ",
            "ye" => "є",
            "Yi" => "Ї",
            "II" => "І",
            "Ge" => "Ґ",
            "YE" => "Є",
            "nj"=>'њ',
            "gj"=>'ѓ',
            "dz"=>'џ',
            "dj"=>'џ',
            "c"=>'ч',
            "ch"=>'ч',
            "ch"=>'ч',
            "zh"=>'ж',
            "z"=>'з',
            's'=>'с',
            'c'=>'ц',
        ];
        return strtr($string, $gost);
    }    public function to_cyrillic3($string)
    {
        $gost = [
            'zenski'=>'женски',
            'sk'=>'ск',
            'j'=>'Ј',
            "a" => "а", "b" => "б", "v" => "в", "g" => "г", "d" => "д", "e" => "е", "yo" => "ё",
            'i'=>'и',"ii" => "и", "ji" => "й", "k" => "к",
            "l" => "л", "m" => "м", "n" => "н", "o" => "о", "p" => "п", "r" => "р", "s" => "с", "t" => "т",
            "y" => "у", "f" => "ф", "h" => "х", "c" => "ц",
            "ch" => "ч", "sh" => "ш", "sch" => "щ", "ie" => "ы", "u" => "у", "ya" => "я", "A" => "А", "B" => "Б",
            "V" => "В", "G" => "Г", "D" => "Д", "E" => "Е", "Yo" => "Ё", "J" => "Ж", "Z" => "З", "I" => "И", "Ji" => "Й",
            "K" => "К", "L" => "Л", "M" => "М",
            "N" => "Н", "O" => "О", "P" => "П",
            "R" => "Р", "S" => "С", "T" => "Т", "Y" => "Ю", "F" => "Ф", "H" => "Х", "C" => "Ц", "Ch" => "Ч", "Sh" => "Ш",
            "Sch" => "Щ", "Ie" => "Ы", "U" => "У", "Ya" => "Я", "'" => "ь", "_'" => "Ь", "''" => "ъ", "_''" => "Ъ",
            "yi" => "ї", "ge" => "ґ",
            "ye" => "є",
            "Yi" => "Ї",
            "II" => "І",
            "Ge" => "Ґ",
            "YE" => "Є",
            "nj"=>'њ',
            "gj"=>'ѓ',
            "dz"=>'џ',
            "dj"=>'џ',
            "c"=>'ч',
            "ch"=>'ч',
            "ch"=>'ч',
            "zh"=>'ж',
            "z"=>'з',
            's'=>'с',
            'c'=>'ч',
        ];
        return strtr($string, $gost);
    }
    protected function to_latin($string)
    {
        $gost = [
            "а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d",
            "е" => "e", "ё" => "yo", "ж" => "j", "з" => "z", "и" => "i",
            "й" => "ji", "к" => "k", "л" => "l", "м" => "m", "н" => "n",
            "о" => "o", "п" => "p", "р" => "r", "с" => "s", "т" => "t",
            "у" => "y", "ф" => "f", "х" => "h", "ц" => "c", "ч" => "ch",
            "ш" => "sh", "щ" => "sch", "ы" => "ie", "э" => "e", "ю" => "u",
            "я" => "ya",
            "А" => "A", "Б" => "B", "В" => "V", "Г" => "G", "Д" => "D",
            "Е" => "E", "Ё" => "Yo", "Ж" => "J", "З" => "Z", "И" => "I",
            "Й" => "Ji", "К" => "K", "Л" => "L", "М" => "M", "Н" => "N",
            "О" => "O", "П" => "P", "Р" => "R", "С" => "S", "Т" => "T",
            "У" => "Y", "Ф" => "F", "Х" => "H", "Ц" => "C", "Ч" => "Ch",
            "Ш" => "Sh", "Щ" => "Sch", "Ы" => "Ie", "Э" => "E", "Ю" => "U",
            "Я" => "Ya",
            "ь" => "'", "Ь" => "_'", "ъ" => "''", "Ъ" => "_''",
            "ї" => "yi",
            "і" => "i",
            "ґ" => "ge",
            "є" => "ye",
            "Ї" => "Yi",
            "І" => "I",
            "Ґ" => "Ge",
            "Є" => "YE",
            'њ'=>'nj',
            'ѓ'=>'gj',
            'ќ'=>'kj',
            'џ'=>'dj',
            'ж'=>'zh',
            's'=>'s',
            'ш'=>'s',
            'љ'=>'lj',
            'ч'=>'c',
            'Ј'=>'j',
            'ј'=>'j',
            'ф'=>'f',
            'Ф'=>'F',
            'х'=>'kc',
        ];
        return strtr($string, $gost);
    }
    protected function to_latin2($string)
    {
        $gost = [
            "а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d",
            "е" => "e", "ё" => "yo", "ж" => "j", "з" => "z", "и" => "i",
            "й" => "ji", "к" => "k", "л" => "l", "м" => "m", "н" => "n",
            "о" => "o", "п" => "p", "р" => "r", "с" => "s", "т" => "t",
            "у" => "u", "ф" => "f", "х" => "h", "ц" => "c", "ч" => "ch",
            "ш" => "sh", "щ" => "sch", "ы" => "ie", "э" => "e", "ю" => "u",
            "я" => "ya",
            "А" => "A", "Б" => "B", "В" => "V", "Г" => "G", "Д" => "D",
            "Е" => "E", "Ё" => "Yo", "Ж" => "J", "З" => "Z", "И" => "I",
            "Й" => "Ji", "К" => "K", "Л" => "L", "М" => "M", "Н" => "N",
            "О" => "O", "П" => "P", "Р" => "R", "С" => "S", "Т" => "T",
            "У" => "Y", "Ф" => "F", "Х" => "H", "Ц" => "C", "Ч" => "Ch",
            "Ш" => "Sh", "Щ" => "Sch", "Ы" => "Ie", "Э" => "E", "Ю" => "U",
            "Я" => "Ya",
            "ь" => "'", "Ь" => "_'", "ъ" => "''", "Ъ" => "_''",
            "ї" => "yi",
            "і" => "i",
            "ґ" => "ge",
            "є" => "ye",
            "Ї" => "Yi",
            "І" => "I",
            "Ґ" => "Ge",
            "Є" => "YE",
            'њ'=>'nj',
            'ѓ'=>'gj',
            'ќ'=>'kj',
            'џ'=>'dz',
            'ж'=>'zh',
            's'=>'s',
            'ш'=>'s',
            'љ'=>'lj',
            'ч'=>'c',
            'Н'=>'N',
            'н'=>'n',
        ];
        return strtr($string, $gost);
    }
    protected function to_latin3($string)
    {
        $gost = [
            'кс'=>'x',
            "а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d",
            "е" => "e", "ё" => "yo", "ж" => "j", "з" => "z", "и" => "i",
            "й" => "ji", "к" => "k", "л" => "l", "м" => "m", "н" => "n",
            "о" => "o", "п" => "p", "р" => "r", "с" => "s", "т" => "t",
            "у" => "u", "ф" => "f", "х" => "h", "ц" => "c", "ч" => "ch",
            "ш" => "sh", "щ" => "sch", "ы" => "ie", "э" => "e", "ю" => "u",
            "я" => "ya",
            "А" => "A", "Б" => "B", "В" => "V", "Г" => "G", "Д" => "D",
            "Е" => "E", "Ё" => "Yo", "Ж" => "J", "З" => "Z", "И" => "I",
            "Й" => "Ji", "К" => "K", "Л" => "L", "М" => "M", "Н" => "N",
            "О" => "O", "П" => "P", "Р" => "R", "С" => "S", "Т" => "T",
            "У" => "Y", "Ф" => "F", "Х" => "H", "Ц" => "C", "Ч" => "Ch",
            "Ш" => "Sh", "Щ" => "Sch", "Ы" => "Ie", "Э" => "E", "Ю" => "U",
            "Я" => "Ya",
            "ь" => "'", "Ь" => "_'", "ъ" => "''", "Ъ" => "_''",
            "ї" => "yi",
            "і" => "i",
            "ґ" => "ge",
            "є" => "ye",
            "Ї" => "Yi",
            "І" => "I",
            "Ґ" => "Ge",
            "Є" => "YE",
            'њ'=>'nj',
            'ѓ'=>'gj',
            'ќ'=>'kj',
            'џ'=>'dz',
            'ж'=>'zh',
            's'=>'s',
            'ш'=>'s',
            'љ'=>'lj',
            'ч'=>'c',
            'Н'=>'N',
            'н'=>'n',
            'к'=>'c',
        ];
        return strtr($string, $gost);
    }

    public function generateSearchWords($slug){
        $search2=$this->to_cyrillic($slug);
        $search3=$this->to_cyrillic2($slug);
        $search6=$this->to_cyrillic3($slug);
        $search8=$this->to_cyrillic3($slug);

        $search4=$this->to_latin(strtolower($slug));
        $search5=$this->to_latin2(strtolower($slug));
        $search7=$this->to_latin3(strtolower($slug));

        $text=$slug." ".$search2." ".$search3." ".$search4." ".$search5." ".$search6." ".$search7." ".$search8;
        $array=explode(' ',$text);
    
        return $array;
    }
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
}
