  create view [genetic_annotation_view] as select c.name as crop, g.name as marker_name, m.name  as dataset,
  assay_method
      ,scoring_method
      ,control_values
      ,observation_alleles_count
      ,max_gob_alleles
      ,size_alleles
      ,unusual_alleles from crop c, genetic_marker g, method m, genetic_annotation a
	  where g.crop_id=c.crop_id and g.genetic_marker_id=a.genetic_marker_id and a.method_id=m.method_id
