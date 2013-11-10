#ifndef _CCB_CCNODELOADERLISTENER_H_
#define _CCB_CCNODELOADERLISTENER_H_

#include "cocos2d.h"

NS_CC_EXT_BEGIN
class NodeLoader;
class NodeLoaderListener {
    public:
        /**
         * @js NA
         * @lua NA
         */
        virtual ~NodeLoaderListener() {};
        /**
         * @js NA
         * @lua NA
         */
        virtual void onNodeLoaded(Node * pNode, NodeLoader * pNodeLoader) = 0;
};

NS_CC_EXT_END

#endif
