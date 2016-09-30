module CsvExporter
  # Export calculation result of capitalizable hour to CSV file.
  #
  # +header+ is the header of CSV file, pass in as an array of string.
  # +project_full_name_prefix_array+ is an array of project full name prefix. E.g. ["RB Projects(AU)", "RB Projects(LA)"]
  # +date_format+ is the string of date format, default is "%e-%b-%y".
  # +hour_format+ is the string of date format, default is 1.
  # +hourly_rate_format+ is the string of date format, default is '%.2f'.

  def result_to_csv(header,
                    project_full_name_prefix_array,
                    date_format,
                    hour_format,
                    hourly_rate_format)

    date_format ||= '%e-%b-%y'
    hour_format ||= '%f'
    hourly_rate_format ||= '%.2f'
    project_full_name_prefix_array ||= ['RB Projects(AU)', 'RB Projects(US)']
    header ||= ['Project Name', 'Employee', 'Date', 'Hours', 'Full Project Name', 'Project Rate']

    CSV.generate do |csv|
      csv << header
      @result.each do |row|
        full_project_name = project_full_name_prefix_array[row.location - 1] + ' : ' + row.project
        employee_name = row.employee_name.to_s
        date = row.date.strftime(date_format)
        hours = hour_format % row.cap_hour
        hourly_rate = hourly_rate_format % row.hourly_rate
        csv << [full_project_name,
                employee_name,
                date,
                hours,
                full_project_name,
                hourly_rate]
      end
    end
  end
end