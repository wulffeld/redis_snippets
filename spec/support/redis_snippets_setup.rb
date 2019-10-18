Rails.application.config.redis_snippets = {
  connection: MockRedis.new,
  keys: [
    :advert_header,
    :advert_footer
  ]
}
