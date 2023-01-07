resource "aws_waf_xss_match_set" "xss_match_set" {
  name = "XSS Detection"

  xss_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }
  xss_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "URI"
    }
  }
  xss_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }
  xss_match_tuples {
    text_transformation = "URL_DECODE"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_geo_match_set" "brazil_only" {
  name = "Brazil only"

  geo_match_constraint {
    type  = "Country"
    value = "BR"
  }
}

resource "aws_waf_size_constraint_set" "header_size" {
  name = "HeaderSize"

  size_constraints {
    text_transformation = "NONE"
    comparison_operator = "GT"
    size                = "8436"

    field_to_match {
      type = "HEADER"
      data = "content-length"
    }
  }
}

resource "aws_waf_sql_injection_match_set" "sql_set" {
  name = "SQL injection Detection"

  sql_injection_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"
    field_to_match {
      type = "QUERY_STRING"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"
    field_to_match {
      type = "URI"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "URL_DECODE"
    field_to_match {
      type = "QUERY_STRING"
    }
  }
  sql_injection_match_tuples {
    text_transformation = "URL_DECODE"
    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_byte_match_set" "google_bot" {
  name = "Googlebot"

  byte_match_tuples {
    text_transformation   = "NONE"
    target_string         = "Googlebot"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
}

resource "aws_waf_byte_match_set" "api" {
  name = "API"

  byte_match_tuples {
    text_transformation   = "NONE"
    target_string         = "/api"
    positional_constraint = "STARTS_WITH"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_byte_match_set" "admin_area" {
  name = "Admin Area"

  byte_match_tuples {
    text_transformation   = "LOWERCASE"
    target_string         = "/admin"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_rate_based_rule" "block_google_based_rule" {
  depends_on  = [aws_waf_byte_match_set.google_bot]
  name        = "Block Google abuse"
  metric_name = "BlockGoogleabuse"

  rate_key   = "IP"
  rate_limit = 2000

  predicates {
    data_id = aws_waf_byte_match_set.google_bot.id
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rate_based_rule" "block_api_based_rule" {
  depends_on  = [aws_waf_byte_match_set.api]
  name        = "API abuse"
  metric_name = "APIabuse"

  rate_key   = "IP"
  rate_limit = 2000

  predicates {
    data_id = aws_waf_byte_match_set.api.id
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_regex_pattern_set" "rp_unwanted_bots" {
  name = "Unwanted Bots"
  regex_pattern_strings = [
    "MojeekBot|Codewisebot|your-search-bot|SMTBot|BLEXBot",
    "BDCbot|Exabot|Cliqzbot|linkdexbot|Mail.RU_Bot",
    "proximic|TweetmemeBot|Genieo|BUbiNG|bingbot|msnbot",
    "Leikibot|istellabot|coccocbot|Wotbox|linkfluence",
    "ExtLinksBot|YandexBot|YandexImages|YandexMobileBot",
    "DotBot|MJ12bot|AwarioRssBot|Mappy",
    "DeuSu|Barkrowler|spbot|YandexAntivirus",
    "ia_archiver|AlphaBot|SeznamBot|ias_crawler|changedetection",
    "Sogou|Yeti|special_archiver|AhrefsBot|archive.org_bot",
    "James BOT|Gigabot|SurdotlyBot|Mediatoolkitbot|Jooblebot"
  ]
}

resource "aws_waf_regex_match_set" "rm_unwanted_bots" {
  name = "Unwanted Bots"

  regex_match_tuple {
    field_to_match {
      data = "User-Agent"
      type = "HEADER"
    }
    regex_pattern_set_id = aws_waf_regex_pattern_set.rp_unwanted_bots.id
    text_transformation  = "NONE"
  }
}

resource "aws_waf_rule" "brazil_only_rule" {
  depends_on  = [aws_waf_geo_match_set.brazil_only]
  name        = "Brazil only"
  metric_name = "Brazilonly"

  predicates {
    data_id = aws_waf_geo_match_set.brazil_only.id
    negated = true
    type    = "GeoMatch"
  }
}

resource "aws_waf_rule" "header_size_rule" {
  depends_on  = [aws_waf_size_constraint_set.header_size]
  name        = "Header Size"
  metric_name = "HeaderSize"

  predicates {
    data_id = aws_waf_size_constraint_set.header_size.id
    negated = false
    type    = "SizeConstraint"
  }
}

resource "aws_waf_rule" "sql_rule" {
  depends_on  = [aws_waf_sql_injection_match_set.sql_set]
  name        = "SQL Injection Rule"
  metric_name = "SecurityAutomationsSqlInjectionRule"

  predicates {
    data_id = aws_waf_sql_injection_match_set.sql_set.id
    negated = false
    type    = "SqlInjectionMatch"
  }
}

resource "aws_waf_rule" "xss_rule" {
  depends_on  = [aws_waf_xss_match_set.xss_match_set]
  name        = "XSS Rule"
  metric_name = "SecurityAutomationsXssRule"

  predicates {
    data_id = aws_waf_xss_match_set.xss_match_set.id
    negated = false
    type    = "XssMatch"
  }
}

resource "aws_waf_rule" "google_rule" {
  depends_on  = [aws_waf_byte_match_set.google_bot]
  name        = "Google hard block"
  metric_name = "Googlehardblock"

  predicates {
    data_id = aws_waf_byte_match_set.google_bot.id
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "admin_rule" {
  depends_on  = [aws_waf_byte_match_set.admin_area]
  name        = "Admin Area"
  metric_name = "AdminArea"

  predicates {
    data_id = aws_waf_byte_match_set.admin_area.id
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_rule" "unwanted_bots_rule" {
  depends_on  = [aws_waf_regex_match_set.rm_unwanted_bots]
  name        = "Unwanted Bots"
  metric_name = "UnwantedBots"

  predicates {
    data_id = aws_waf_regex_match_set.rm_unwanted_bots.id
    negated = false
    type    = "RegexMatch"
  }
}

resource "aws_waf_web_acl" "web_acl" {
  depends_on = [
    aws_waf_rate_based_rule.block_api_based_rule,
    aws_waf_rate_based_rule.block_google_based_rule,
    aws_waf_rule.unwanted_bots_rule,
    aws_waf_rule.sql_rule
  ]
  name        = "WAF-Pack"
  metric_name = "SecurityAutomationsMaliciousRequesters"
  default_action {
    type = "ALLOW"
  }

  rules {
    action {
      type = "BLOCK"
    }
    priority = 90
    rule_id  = aws_waf_rate_based_rule.block_api_based_rule.id
    type     = "RATE_BASED"
  }
  rules {
    action {
      type = "COUNT"
    }
    priority = 93
    rule_id  = aws_waf_rate_based_rule.block_google_based_rule.id
    type     = "RATE_BASED"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 96
    rule_id  = aws_waf_rule.unwanted_bots_rule.id
    type     = "REGULAR"
  }
  rules {
    action {
      type = "BLOCK"
    }
    priority = 101
    rule_id  = aws_waf_rule.sql_rule.id
    type     = "REGULAR"
  }
}