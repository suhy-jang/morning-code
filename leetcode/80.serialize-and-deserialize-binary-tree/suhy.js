/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

/**
 * Encodes a tree to a single string.
 *
 * @param {TreeNode} root
 * @return {string}
 */
const serializeDFS = (root, str) => {
    if (root === null) {
        return str += 'null,';
    }
    str += root.val + ',';
    str = serializeDFS(root.left, str);
    str = serializeDFS(root.right, str);
    return str;
}
const serialize = (root) => {
    return serializeDFS(root, '');
};

/**
 * Decodes your encoded data to tree.
 *
 * @param {string} data
 * @return {TreeNode}
 */
const deserializeDFS = (nodes) => {
    let next = nodes.shift();
    if (!next || next === 'null') {
        return null;
    }
    
    let node = new TreeNode(next);
    node.left = deserializeDFS(nodes);
    node.right = deserializeDFS(nodes);
    return node;
    
}
const deserialize = (data) => {
    let nodes = data.split(',');
    return deserializeDFS(nodes);
};

/**
 * Your functions will be called as such:
 * deserialize(serialize(root));
 */
