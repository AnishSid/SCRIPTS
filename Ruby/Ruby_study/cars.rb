class Cars
    include Enumerable

      def each
            yield 'Acura'
                yield 'Lexus'
                    yield 'Infinity'
                      end
end

c=Cars.new
c.map {|i| i.upcase } # ["ACURA", "LEXUS", "INFINITY"]
      end
end
