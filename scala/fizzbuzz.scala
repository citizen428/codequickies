import collection.immutable.HashMap
import collection.immutable.Range.Inclusive

def fizz_buzz(r: Inclusive, subs: HashMap[Int, String]): IndexedSeq[String] = {
  r map { x =>
    val s = subs.foldLeft("") { case (acc, (k,v)) => if (x % k == 0) v + acc else acc }
    if (s.isEmpty) x.toString else s
  }
}

fizz_buzz(new Inclusive(14,21,1), HashMap(3 -> "Fizz", 5 -> "Buzz", 7 -> "Dazz")) foreach println
