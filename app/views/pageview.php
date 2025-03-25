<?php

class Pageview extends View {
  private $localizations = array();

  # Initialize keywords dictionary
  public function __construct(){
    $this->build_locales();
  }

  # Replace keywords
  public function replace_localizations($html) {

    foreach ($this->localizations as $key => $value) {
      $html = str_replace("{\$" . $key . "\$}", $value, $html);
    }

    return $html;
  }

  # Keyword list
  protected function build_locales() {
    $this->localizations = array(
      "PAGE_TITLE" => WEB_TITLE,
      "SITE_ROOT" => SITE_ROOT,
      "MEDIA" => MEDIA,
      "HOME_TITLE" => "Тестовое задание PHP",
      "ABOUT_TITLE" => "О проекте",
      "CONTACT_TITLE" => "Контакты"
    );

    return $this->localizations;
  }

}

?>