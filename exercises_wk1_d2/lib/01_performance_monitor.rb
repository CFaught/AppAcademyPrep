def measure(n=1, &prc)
  sum = 0
  n.times do
    start_time = Time.now
    prc.call
    sum += Time.now - start_time
  end
  sum / n
end
