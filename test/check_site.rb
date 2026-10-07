require 'pathname'

root = Pathname.new('_site')
routes = {
  '/' => root.join('index.html'),
  '/research/' => root.join('research/index.html'),
  '/publications/' => root.join('publications/index.html'),
  '/code/' => root.join('code/index.html'),
  '/cv/' => root.join('cv/index.html'),
  '/sidequests/' => root.join('sidequests/index.html')
}

raise 'CV PDF missing from build' unless root.join('assets/cv/TS_CV.pdf').binread(4) == '%PDF'
%w[
  assets/poster/CAPO_OxML_A0.pdf
  assets/poster/Poster_RL.pdf
  assets/pres/xAI_in_pers_cancer_medicine.pdf
  assets/reports/Final_Report_MNLP.pdf
].each do |asset|
  raise "PDF missing from build: #{asset}" unless root.join(asset).binread(4) == '%PDF'
end
raise 'Favicon missing from build' unless root.join('assets/img/favicon/doodle-portrait-favicon.png').binread(8) == "\x89PNG\r\n\x1a\n".b
raise 'CSS missing from build' unless root.join('assets/css/portfolio.css').file?
raise '404 page missing from build' unless root.join('404.html').file?

routes.each do |route, path|
  raise "Page missing: #{route}" unless path.file?

  html = path.read
  routes.each_key do |destination|
    raise "Navigation link #{destination} missing on #{route}" unless html.include?("href=\"#{destination}\"")
  end
  raise "Wrong canonical URL on #{route}" unless html.include?("https://theoschifferli.ch#{route}")
  raise "Missing copyright on #{route}" unless html.include?('© Copyright 2026 Théo Schifferli.')
  raise "Missing push date on #{route}" unless html.include?('Last updated:')
  if File.file?('.config.build.yml') && html.include?('Last updated: local preview')
    raise "Published page has no push date: #{route}"
  end
  raise "Template content leaked into #{route}" if html.match?(/You R\. Name|alshedivat|al-folio preview/i)
end

about = routes.fetch('/').read
raise 'Contact link missing' unless about.include?('mailto:theo.schifferli@biie.ai')
raise 'LinkedIn link missing' unless about.include?('https://www.linkedin.com/in/theoschiff/')
raise 'Portrait missing' unless about.include?('/assets/img/portrait/TSchifferli_cropped.jpg')
raise 'Old portrait caption remains' if about.include?("hi, I'm Théo")
research = routes.fetch('/research/').read
raise 'Reasoning poster missing' unless research.include?('/assets/poster/Poster_RL.pdf')
raise 'Small-model report missing' unless research.include?('/assets/reports/Final_Report_MNLP.pdf')
publications = routes.fetch('/publications/').read
raise 'BioRxiv paper missing' unless publications.include?('https://www.biorxiv.org/content/10.64898/2026.09.30.755793v1')
raise 'CAPO poster missing' unless publications.include?('/assets/poster/CAPO_OxML_A0.pdf')
raise 'Cancer medicine slides missing' unless publications.include?('/assets/pres/xAI_in_pers_cancer_medicine.pdf')
raise 'CV PDF link missing' unless routes.fetch('/cv/').read.include?('/assets/cv/TS_CV.pdf')
raise 'Sidequests should have its empty state' unless routes.fetch('/sidequests/').read.include?('Nothing on the wall. Yet.')
raise 'Sitemap missing' unless root.join('sitemap.xml').file?

puts 'Portfolio build checks passed.'
