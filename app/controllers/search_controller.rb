class SearchController < ApplicationController

  SEARCH_TYPES = {
    :mp => "member_of_parliament",
    :party => "party",
    :constituency => "constituency",
    :state => "state"
  }

  def index
    results = params[:type].camelize.constantize.all(:name.like => "%#{params[:name]}%")
    respond_to do |format|
      format.json {render :json => results.to_json}
      format.xml {render :xml => results.to_xml}
    end
  end

end