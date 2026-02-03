namespace :backfill do
  desc 'Set vinyl=true on masters that have releases with a Vinyl format'
  task vinyl: :environment do
    updated = Master.where(
      id: Release.joins(:release_formats).where(release_format: { name: 'Vinyl' }).select(:master_id)
    ).update_all(vinyl: true)

    puts "Updated #{updated} masters with vinyl=true"
  end
end
