class SearchController < ApplicationController
  def search
    if code=params[:code] #text_field    if is anti null
      uri=URI.parse("http://zipcloud.ibsnet.co.jp/api/search?#{URI.encode_www_form({zipcode: code})}")#"zipcode=code"
      response=Net::HTTP.get_response(uri) #httpリクエス require 'net/http'は本番環境では必要ない
      result=JSON.parse(response.body) #json形式
      if result["results"]
        @zipcode=result["results"][0]["zipcode"]
        @add1=result["results"][0]["address1"]
        @add2=result["results"][0]["address2"]
        @add3=result["results"][0]["address3"]
      end
    end

  end
end
