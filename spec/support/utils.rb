def open_asset(file_name)
  File.open ["spec/assets/", file_name].join ""
end
