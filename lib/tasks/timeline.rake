namespace :timeline do

  desc "Initial setup."
  task setup: ['db:migrate', 'db:fixtures:load', 'db:seed'] do

    links = {
      'images/timeline' => 'public/images/timeline',
      'images/words'    => 'public/images/words'
    }

    for source, destination in links
      FileUtils.ln_sf(Rails.root + source, Rails.root + destination)
    end

  end

end
