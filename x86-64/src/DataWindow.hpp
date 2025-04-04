#pragma once
#include <vector>
#include <map>
#include "Protocol.hpp"
#include "DataProcessing.hpp"

template <typename PacketType>
class PacketMap: public DataWindow<PacketType> {
protected:
    std::map<uint32_t, PacketType> packetmap;
    typename std::map<uint32_t, PacketType>::iterator iter;
public:
    PacketMap() {};
    ~PacketMap() {};
    
    PacketType* reserve(uint32_t seq_num) override {
        PacketType info;
        auto it = packetmap.insert(std::make_pair(seq_num, info)).first;
        return &(*it).second;
    };

    bool contains(uint32_t seq_num) override {
        return packetmap.count(seq_num) != 0;
    };

    PacketType* get(uint32_t seq_num) override {
        auto it = packetmap.find(seq_num);
        if (it == packetmap.end()) {
            return nullptr;
        } 
        return &(*it).second;
    };

    bool erase(uint32_t seq_num) override {
        return packetmap.erase(seq_num);
    };
    bool isFull() override {
        return false;   // TODO
        return packetmap.size() >= WINDOW_SIZE;
    };
    size_t size() override {
        return packetmap.size();
    }

    bool isEmpty() override {
        return packetmap.empty();
    };

    void clear() override {
        packetmap.clear();
    }

    // Use map iterator for efficient iteration
    void resetIter() override {
        iter = packetmap.begin();
    }
    PacketType* getIter() override {
        return &(*iter).second;
    }
    bool nextIter() override {
        iter++;
        return !isIterDone();
    }
    bool isIterDone() override {
        return iter == packetmap.end();
    };
};

