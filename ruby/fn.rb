def fn(*funs)
  -> x do
    funs.inject(x) do |v, f|
      Enumerable === v ? v.first.send(f, *v[1..-1]) : v.send(f)
    end
  end
end
