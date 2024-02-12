class DirectorsController < ApplicationController
  def index

    render({template: "/director_template/list"})
  end
  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({id: the_id})
    pp matching_records
    @the_director = matching_records.at(0)


    render({template: "/director_template/details"})
  end
  def junior
    @the_name = Director.all.order(dob: :desc).at(0).name
    @the_dob = Director.all.order(dob: :desc).at(0).dob
    @the_id = Director.all.order(dob: :desc).at(0).id
    render({template: "/director_template/junior"})
    
  end
  def senior
    @the_name = Director.where.not({dob: nil}).all.order(dob: :asc).at(0).name
    @the_dob = Director.where.not({dob: nil}).all.order(dob: :asc).at(0).dob
    @the_id = Director.where.not({dob: nil}).all.order(dob: :asc).at(0).id
    render({template: "/director_template/senior"})
  end
end
