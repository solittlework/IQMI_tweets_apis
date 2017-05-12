class Tweet < ApplicationRecord
  include HTTParty
  validates_uniqueness_of :id
  API_URLS = {
    tweets: {
        json: "https://devtestapiapp.herokuapp.com/tweets.json"
    }
  }.freeze

  KEYWORDS = ['coke', 'coca-cola', 'diet-cola'].freeze

  def self.fetch_tweets
    response_body = JSON.parse(HTTParty.get(API_URLS[:tweets][:json]).body)
    # TODO add general functionn to check http status

    error_msg = ""

    # API response format is not consistent which is confusing
    error_msg = response_body.try(:[], "error").try(:[], "message") rescue ""

    if error_msg.blank?
      Tweet.create(response_body)
    end

    return error_msg
  end
end
