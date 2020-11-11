      # def generate(site)
      #   if Pager.pagination_enabled?(site)
      #     if template = template_page(site)
      #       paginate(site, template)
      #     else
      #       Jekyll.logger.warn "Pagination:", "Pagination is enabled, but I couldn't find " +
      #       "an index.html page to use as the pagination template. Skipping pagination."
      #     end
      #   end
      # end

      def generate(site)
        if Pager.pagination_enabled?(site)

          path_array = site.config['paginatepath']
          length = path_array.length-1
          for i in 0..length do
            site.config['paginate_path'] = path_array[i]
            if template = template_page(site)
              paginate(site, template)
            else
              Jekyll.logger.warn "Pagination:", "Pagination is enabled, but I couldn't find " +
              "an index.html page to use as the pagination template. Skipping pagination."
            end
          end
        end
      end