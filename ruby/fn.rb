# Simplest version
def fn(*funs)
  -> x { funs.inject(x) { |v, f| v.send(f) } }
end

# Version mixing symbols and procs
def fn(*funs)
  -> x do
    funs.inject(x) do |v, f|
      Enumerable === v ? v.first.send(f, *v[1..-1]) : v.send(f)
    end
  end
end
