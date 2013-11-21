module JobsHelper
	def job_status(status)
		case status
			when 1
				"<span class='label label-info'>Nuevo</span>".html_safe
			when 2
				"<span class='label label-success'>En proceso</span>".html_safe
			when 3
				"<span class='label label-warning'>Atrasado</span>".html_safe
			when 4
				"<span class='label label-inverse'>Finalizado</span>".html_safe
		end
	end

	def sold(solded)
		case solded
			when true
				"S&iacute;".html_safe
			when false
				"No"
			else
				"-"
		end
	end
end