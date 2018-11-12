/*
** EPITECH PROJECT, 2018
** CPool_Day13_2018
** File description:
** btree
*/

typedef struct btree
{
    struct btree *left;
    struct btree *right;
    void *item;
} btree_t;
