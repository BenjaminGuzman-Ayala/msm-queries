class DirectorsController < ApplicationController
  def index

    render({template: "/director_template/list"})
  end
end
