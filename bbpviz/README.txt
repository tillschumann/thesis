 * A Binary spike report reader.
 *
 * The format read by this plugin is:
 * - 4b integer: magic '0xf0a'
 * - 4b integer: version, currently '1'
 * - (4b float, 4b integer) pairs until end of file: spike time, neuron GID,
 *   sorted by time
