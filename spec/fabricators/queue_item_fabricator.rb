Fabricator(:queue_item) do
  position { (1..5).to_a.sample }
end
