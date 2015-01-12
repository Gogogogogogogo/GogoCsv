module GogoCsv
  class ::Array
    def save!(path=nil)
      raise 'should be array of array' unless arys?
      raise 'Should supply file path' unless path ||= $current_path

      CSV.open(File.expand_path(path), "wb") do |csv|
        each { |ary| csv <<  ary }
      end
    end

    private

      def arys?
        all? { |item| item.is_a?(Array) }
      end
  end
end
