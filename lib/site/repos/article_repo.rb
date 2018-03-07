require "site/repo"

module Site
  module Repos
    class ArticleRepo < Site::Repo[:articles]
      def published
        articles
          .published
          .by_date_descending
          .to_a
      end

      def internal_published
        articles
          .published
          .internal
          .by_date_descending
          .to_a
      end
    end
  end
end
