class ArticlesController < ApplicationController
    def create
        Rails.logger.debug("articles create")
        title = params[:new_passage][:title]
        content = params[:new_passage][:content]
        catalog = params[:new_passage][:catalog]
        catalog = 100
        Rails.logger.debug(content)
   
        title = Mysql2::Client.escape(title)
        content = Mysql2::Client.escape(content)
        p = Passages.new(title:title, content:content, catalog:catalog)
        p.save
        redirect_to root_path
    end

    def new
        title = params[:new_passage][:title]
        content = params[:new_passage][:content]
        catalog = params[:new_passage][:catalog]
        catalog = 100
        Rails.logger.debug("articles new")
        Rails.logger.debug(content)
   
        title = Mysql2::Client.escape(title)
        content = Mysql2::Client.escape(content)
        p = Passages.new(title:title, content:content, catalog:catalog)
        p.save
    end

    def update
        Rails.logger.debug("articles update")
    end

    def index
        Rails.logger.debug("articles index")
    end

    def destroy
        Rails.logger.debug("articles destroy")
        p = Passages.find(params[:id])
        p.destroy
    end
end
