class PhpeyeCrawler < Versioneye::Crawl


  include HTTParty


  def self.logger
    if !defined?(@@log) || @@log.nil?
      @@log = Versioneye::DynLog.new("log/phpeye.log", 10).log
    end
    @@log
  end


  def self.crawl
    logger.info "start PhpeyeCrawler"
    ProductService.all_products_by_lang_paged("PHP") do |products|
      process products
    end
    logger.info "stop PhpeyeCrawler"
    return nil
  end


  def self.process products
    products.each do |product|
      crawle_package product
    end
  rescue => e
    self.logger.error e.message
    self.logger.error e.backtrace.join("\n")
  end


  def self.crawle_package product
    prod_key = product.prod_key
    resource = "http://php-eye.com/api/v1/package/#{prod_key}.json"
    response = HTTParty.get( resource ).response
    return nil if response.code.to_i != 200

    image = JSON.parse response.body
    image['versions'].each do |version_obj|
      version_number = CrawlerUtils.remove_version_prefix( version_obj['name'] )
      version = product.version_by_number version_number
      next if version.nil?

      supported_runtimes = []
      version_obj['travis']['runtime_status'].keys.each do |key|
        value = version_obj['travis']['runtime_status'][key]
        supported_runtimes << key if value.to_i == 3
      end
      version.tested_runtimes = supported_runtimes.join(', ')
      version.save
      logger.info " - update runtime info for - #{product.prod_key}:#{version_number} - #{version.tested_runtimes}"
    end
  rescue => e
    self.logger.error "ERROR in crawle_package(#{name}) Message: #{e.message}"
    self.logger.error e.backtrace.join("\n")
    nil
  end


end
