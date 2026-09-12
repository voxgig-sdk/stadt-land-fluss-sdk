import { StadtLandFlussEntityBase } from '../StadtLandFlussEntityBase';
import type { StadtLandFlussSDK } from '../StadtLandFlussSDK';
import type { Control } from '../types';
import type { Data, DataListMatch } from '../StadtLandFlussTypes';
declare class DataEntity extends StadtLandFlussEntityBase<Data> {
    constructor(client: StadtLandFlussSDK, entopts: any);
    make(this: DataEntity): DataEntity;
    list(this: any, reqmatch?: DataListMatch, ctrl?: Control): Promise<DataEntity[]>;
}
export { DataEntity };
