class AnimationUtiliites {

  func cubicBezeir(p0: Float, p1: Float, p2: Float, p3: Float, t: Float) -> Float {
    let oneT = 1 - t

    return p0 * (oneT * oneT * oneT)
      + 3 * p1 * (oneT * oneT) * t
      + 3 * p2 * oneT * (t * t)
      + p3 * (t * t * t)
  }

  func makeCubicBezierFunction(
    x0: Float, y0: Float,
    x1: Float, y1: Float,
    x2: Float, y2: Float,
    x3: Float, y3: Float
  ) -> ((Float) -> Float) {

    return { (t: Float) -> Float in
      let time = self.cubicBezeir(p0: x0, p1: x1, p2: x2, p3: x3, t: t)
      let res = self.cubicBezeir(p0: y0, p1: y1, p2: y2, p3: y3, t: time)
      return res
    }
  }
}
