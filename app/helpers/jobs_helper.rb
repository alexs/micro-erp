module JobsHelper
	def job_status(status)
		case status
			when 1
				"Nuevo"
			when 2
				"En proceso"
			when 3
				"Finalizado"
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