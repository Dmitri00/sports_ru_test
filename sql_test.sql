select sports_tags.name, count(tag_c.tag_id) as tag_count from sports_tags
left join
  (Select unnest(tags) as tag_id  from
	     (Select tags from sports_posts) as tag) as tag_c
on sports_tags.tag_id=tag_c.tag_id
group by sports_tags.name
order by tag_count desc
limit 5;
select post_id, array_length(tags,1) as tags_count from sports_posts order by tags_count desc;

