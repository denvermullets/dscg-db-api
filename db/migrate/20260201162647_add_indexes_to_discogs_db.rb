class AddIndexesToDiscogsDb < ActiveRecord::Migration[8.1]
  def change
    # Primary keys on core tables
    execute "ALTER TABLE public.artist ADD PRIMARY KEY (id)"
    execute "ALTER TABLE public.label ADD PRIMARY KEY (id)"
    execute "ALTER TABLE public.master ADD PRIMARY KEY (id)"
    execute 'ALTER TABLE public."release" ADD PRIMARY KEY (id)'

    # artist child tables
    add_index :artist_alias, :artist_id
    add_index :artist_image, :artist_id
    add_index :artist_namevariation, :artist_id
    add_index :artist_url, :artist_id

    # group_member
    add_index :group_member, :group_artist_id
    add_index :group_member, :member_artist_id

    # label child tables
    add_index :label_image, :label_id
    add_index :label_url, :label_id
    add_index :label, :parent_id

    # master child tables
    add_index :master_artist, :master_id
    add_index :master_artist, :artist_id
    add_index :master_genre, :master_id
    add_index :master_style, :master_id
    add_index :master_image, :master_id
    add_index :master_video, :master_id

    # release foreign key
    add_index :release, :master_id

    # release child tables
    add_index :release_artist, :release_id
    add_index :release_artist, :artist_id
    add_index :release_company, :release_id
    add_index :release_format, :release_id
    add_index :release_genre, :release_id
    add_index :release_style, :release_id
    add_index :release_identifier, :release_id
    add_index :release_image, :release_id
    add_index :release_label, :release_id
    add_index :release_label, :label_id
    add_index :release_video, :release_id

    # release_track
    add_index :release_track, :release_id
    add_index :release_track, :track_id

    # release_track_artist (joined via text track_id)
    add_index :release_track_artist, :track_id
    add_index :release_track_artist, :release_id
    add_index :release_track_artist, :artist_id

    # name/title columns for search
    add_index :artist, :name
    add_index :label, :name
    add_index :master, :title
    add_index :release, :title
  end
end
