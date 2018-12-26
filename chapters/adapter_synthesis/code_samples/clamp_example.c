int clamp_target(int x) {
    if ((unsigned)x > 255) x = x < 0 ? 0 : 255;
    return x;
}
#include <boost/algorithm/clamp.hpp>
extern "C" int clamp_reference(int x, int lo, int hi)
{
    return boost::algorithm::clamp(x, lo, hi);
}
