require 'rubygems'
require 'nokogiri'
require 'open-uri'

class PagesController < ApplicationController

  # GET /pages
  def index
    @pages = Page.all

    render json: @pages
  end

  # POST /pages (/scrap)
  def create
    @page = Page.new(url: page_params)

    if @page.save
      title_scrap(@page)
      link_scrap(@page)
      render json: @page
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  private
    # Uses Nokogiri to parse given URL searching for titles
    def title_scrap(page)
      webpage = Nokogiri::HTML(open(page_params))
      parse_title("h1", page, webpage)
      parse_title("h2", page, webpage)
      parse_title("h3", page, webpage)
    end

    # Iterate over title tags in webpage
    def parse_title(tag, page, webpage)
      webpage.css(tag).each do |title| 
        @title_obj = Title.new(tag: tag, content: title.text.strip)
        page.titles << @title_obj
      end
    end

    # Uses Nokogiri to parse given URL searching for links
    def link_scrap(page)
      webpage = Nokogiri::HTML(open(page_params))
      webpage.css('a').each do |link| 
        @link_obj = Link.new(text: link.text.strip, href: link['href'])
        page.links << @link_obj
      end
    end
    
    def page_params
      params.require(:url)
    end
end
