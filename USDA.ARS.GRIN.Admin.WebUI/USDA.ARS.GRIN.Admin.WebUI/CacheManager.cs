using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace USDA.ARS.GRIN.Admin.WebUI
{
    public class CacheManager
    {
        //public class SimpleMemoryCache<TItem>
        //{
        //    private MemoryCache _cache = new MemoryCache(new MemoryCacheOptions());

        //    public TItem GetOrCreate(object key, Func<TItem> createItem)
        //    {
        //        TItem cacheEntry;
        //        if (!_cache.TryGetValue(key, out cacheEntry))// Look for cache key.
        //        {
        //            // Key not in cache, so get data.
        //            cacheEntry = createItem();

        //            // Save data in cache.
        //            _cache.Set(key, cacheEntry);
        //        }
        //        return cacheEntry;
        //    }
        //}

        //USAGE
        //var _avatarCache = new SimpleMemoryCache<byte[]>();
        //// ...
        //var myAvatar = _avatarCache.GetOrCreate(userId, () => _database.GetAvatar(userId));
        //REF: https://michaelscodingspot.com/cache-implementations-in-csharp-net/
    }
}