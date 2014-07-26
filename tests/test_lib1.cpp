
#include <gtest/gtest.h>

#include "lib1.hpp"

TEST(SumTest, can_sum_value_and_zero)
{
    EXPECT_EQ(sum(0, 1), 1);
    EXPECT_EQ(sum(1, 0), 1);

    EXPECT_EQ(sum(0, -1), -1);
    EXPECT_EQ(sum(-1, 0), -1);

    EXPECT_EQ(sum(0, 0), 0);
}

TEST(SumTest, can_sum_two_neg_values)
{
    EXPECT_EQ(sum(-1, -2), -3);
    EXPECT_EQ(sum(-3, -2), -5);
}
